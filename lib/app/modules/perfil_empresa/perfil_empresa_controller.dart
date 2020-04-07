import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/fetch_services/fetch_services_controller.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';
import 'package:url_launcher/url_launcher.dart';

part 'perfil_empresa_controller.g.dart';
// import 'model';

class PerfilEmpresaController = _PerfilEmpresaControllerBase
    with _$PerfilEmpresaController;

abstract class _PerfilEmpresaControllerBase with Store {
  RouteController routeController = Modular.get();
  AppController appController = Modular.get();
  FetchServicesController _fetch = Modular.get();

  DocumentSnapshot _lastOfertaFetched;

  _PerfilEmpresaControllerBase() {
    if (hasCompany) {
      _fetchEmpresa();
      _fetchOfertas();
    }
  }

  @observable
  String _empresaID = '';

  @observable
  PerfilEmpresaModel _empresa;

  @observable
  ObservableList<OfertaModel> _ofertas;

  @observable
  RequestStatus _status = RequestStatus.success;

  @computed
  RequestStatus get status => _status;

  @computed
  PerfilEmpresaModel get empresa => _empresa;
  @computed
  ObservableList<OfertaModel> get ofertas => _ofertas;

  @action
  void setStatus(RequestStatus value) => _status = value;

  @action
  void setEmpId(String empID) => _empresaID = empID;

  //Pega os dados da empresa e começa a puxar de novo as ofertas
  @action
  Future fetchPage() async {
    print("AQUI OK");
    if (status == RequestStatus.loading) return;
    try {
      await _fetchEmpresa();
      await _fetchOfertas();
      print("CHEGOU AQUI");
      setStatus(RequestStatus.success);
      // return Future.wait([_fetchEmpresa(), _fetchOfertas(),]);
    } catch (e) {
      setStatus(RequestStatus.error);
      print("ERRO FETCHING PAGE");
      return;
    }
  }

  @action
  Future _fetchOfertas() async {
    setStatus(RequestStatus.loading);

    try {
      var data = await _fetch.fetchOfertas(
          appController.userInfos.empresaPerfil,
          lastFetched: _lastOfertaFetched);
      _ofertas = data[0];
      _lastOfertaFetched = data[1];
      setStatus(RequestStatus.success);
      return;
    } catch (e) {
      setStatus(RequestStatus.error);
      print("ERRO FETCHING OFERTAS");
      return throw e;
    }
  }

  @action
  Future _fetchEmpresa() async {
    setStatus(RequestStatus.loading);
    try {
      print(appController.userInfos.empresaPerfil);
      _empresa =
          await _fetch.fetchEmpresa(appController.userInfos.empresaPerfil);
      setStatus(RequestStatus.success);

      return;
    } catch (e) {
      print("ERRO FETCHING EMPRESA");
      return throw e;
    }
  }

  @action
  Future changeEmpresa(PerfilEmpresaModel aux) async {
    try {
      await Firestore.instance
          .collection('usuarios')
          .document(appController.authInfos.uid)
          .updateData({'empresaPerfil': aux.empresaID});
      _empresa = aux;
      AuthController _auth = Modular.get();
      await _auth.getUserInfos(appController.authInfos.uid);
      _fetchOfertas();
    } catch (e) {}
  }

  @computed
  bool get isDono => (appController.authInfos != null &&
      empresa?.donoEmpresa == appController.authInfos.uid);
  @computed
  bool get hasCompany {
    if (appController.userInfos?.empresaPerfil != null) {
      return true;
    } else
      return false;
  }

  Future<bool> ligarEmpresa(String numero) async {
    if (await canLaunch('tel:+55$numero')) {
      launch('tel:+55$numero');
      return true;
    } else
      return false;
  }

  Future enviaEmail() async {
    final Email email = Email(
      recipients: [empresa.email],
    );
    await FlutterEmailSender.send(email);
  }

  ///////////////////////////

  Future uploadImage(String empresaID, String foto, File img) async {
    task = _storage.ref().child("$empresaID/perfil.jpg").putFile(img);
    try {
      // if (foto != null)
      await task.onComplete;
      // task = null;
      // task = _storage.ref().child("$empresaID/perfil.jpg").putFile(imgFile);

      var complete = await task.onComplete;
      var url = await complete.ref.getDownloadURL();
      empresa.foto = url;
      await Firestore.instance
          .collection('empresas')
          .document(empresaID)
          .updateData({'foto': url});
      print("UPLOADOU");
    } catch (e) {}
  }

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://ofertas-8428f.appspot.com');

  // @observable
  StorageUploadTask task;

  Future<File> _selectGalleryImage() async {
    File selected = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    return selected;
  }

  Future<File> _takeCameraImage() async {
    File selected = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    return selected;
  }

  // @observable
  // File imgFile;

  @action
  Future<File> getImage(int value) async {
    // imgFile = null;
    if (value == 0) {
      File imgFile = await _selectGalleryImage();
      return imgFile;
    } else {
      File imgFile = await _takeCameraImage();

      return imgFile;
    }
  }
}

enum RequestStatus { loading, success, error }

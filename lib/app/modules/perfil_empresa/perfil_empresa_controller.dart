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
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';
import 'package:url_launcher/url_launcher.dart';

part 'perfil_empresa_controller.g.dart';
// import 'model';

class PerfilEmpresaController = _PerfilEmpresaControllerBase
    with _$PerfilEmpresaController;

abstract class _PerfilEmpresaControllerBase with Store {
  RouteController routeController = Modular.get();
  AppController appController = Modular.get();

  _PerfilEmpresaControllerBase() {
    if (hasCompany) {
      fetchEmpresa();
      fetchOfertasEmpresa();
    }
  }

  DocumentSnapshot _lastDocumentOferta;
  int limit = 8;

  @observable
  PerfilEmpresaModel _empresa;

  @observable
  ObservableList<OfertaModel> ofertas = <OfertaModel>[].asObservable();

  @observable
  RequestStatus statusHeader = RequestStatus.loading;

  @observable
  bool hasMoreOfertas = true;

  @observable
  RequestStatus statusFotos = RequestStatus.success;

  @computed
  bool get isDono => (appController.authInfos != null &&
      empresa?.donoEmpresa == appController.authInfos.uid);
  @computed
  bool get hasCompany {
    if (appController.userInfos.empresaPerfil != null) {
      empresa ?? fetchEmpresa();
      return true;
    } else
      return false;
  }

  @computed
  PerfilEmpresaModel get empresa {
    if (_empresa == null) fetchEmpresa();
    fetchOfertasEmpresa();
    return _empresa;
  }

  @action
  void setEmpresa(PerfilEmpresaModel model) {
    // _resetOfertasFetching();
    _empresa = model;
  }

  @action
  void resetOfertasFetching() {
    ofertas = <OfertaModel>[].asObservable();
    statusFotos = RequestStatus.success;
    hasMoreOfertas = true;
    _lastDocumentOferta = null;
  }

  @action
  void setStatusHeader(RequestStatus value) => statusHeader = value;

  @action
  void setStatusFotos(RequestStatus value) => statusFotos = value;

  @action
  void addOfertas(QuerySnapshot query) {
    for (var i = 0; i < query.documents.length; i++) {
      ofertas.add(OfertaModel.fromJson(query.documents[i].data));

      if (i == query.documents.length - 1)
        _lastDocumentOferta = query.documents[i];
    }
    if (query.documents.length == limit)
      hasMoreOfertas = true;
    else
      hasMoreOfertas = false;
    setStatusFotos(RequestStatus.success);
  }

  @action
  Future fetchOfertasEmpresa() async {
    if (statusFotos == RequestStatus.loading || !hasMoreOfertas) return;
    setStatusFotos(RequestStatus.loading);
    if (_lastDocumentOferta == null) {
      var query = await Firestore.instance
          .collection('ofertas')
          .where('empresaDona',
              isEqualTo: appController.userInfos.empresaPerfil)
          .where("mostrar", isEqualTo: true)
          .limit(limit)
          .getDocuments();
      addOfertas(query);
    } else {
      var query = await Firestore.instance
          .collection('ofertas')
          .where('empresaDona',
              isEqualTo: appController.userInfos.empresaPerfil)
          .startAfterDocument(_lastDocumentOferta)
          .limit(limit)
          .getDocuments();
      addOfertas(query);
    }
  }

  @action
  Future fetchEmpresa() async {
    try {
      var empresaDoc = await Firestore.instance
          .collection('empresas')
          .document(appController.userInfos.empresaPerfil)
          .get()
          .timeout(Duration(seconds: 8));
      if (!empresaDoc.exists) throw PlatformException;
      setEmpresa(PerfilEmpresaModel.fromJson(empresaDoc.data));
      setStatusHeader(RequestStatus.success);
      print(empresa.nomeEmpresa);
      return;
    } catch (e) {
      fetchEmpresa();
      setStatusHeader(RequestStatus.error);
    }
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

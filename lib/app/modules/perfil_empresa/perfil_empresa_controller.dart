import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
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
  AuthController authController = Modular.get();

  _PerfilEmpresaControllerBase({this.empresaModel});

  @observable
  PerfilEmpresaModel empresaModel;

  @observable
  Stream<DocumentSnapshot> stream;

  @action
  void setStream(Stream<DocumentSnapshot> value) => stream = value;

  @computed
  bool get isDono => (authController.fbUser != null &&
      empresaModel?.donoEmpresa == authController.fbUser.uid);

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
      print("TESTE");
      return imgFile;
    } else {
      File imgFile = await _takeCameraImage();
      print("TESTE");

      return imgFile;
    }
  }

  @action
  void updateModel(PerfilEmpresaModel model) {
    empresaModel = PerfilEmpresaModel.fromObj(model);
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
      recipients: [empresaModel.email],
    );
    await FlutterEmailSender.send(email);
  }

  Future uploadImage(String empresaID, String foto, File img) async {
    task = _storage.ref().child("$empresaID/perfil.jpg").putFile(img);
    try {
      // if (foto != null)
      await task.onComplete;
      // task = null;
      // task = _storage.ref().child("$empresaID/perfil.jpg").putFile(imgFile);

      var complete = await task.onComplete;
      var url = await complete.ref.getDownloadURL();
      empresaModel.foto = url;
      await Firestore.instance
          .collection('empresas')
          .document(empresaID)
          .updateData({'foto': url});
      print("UPLOADOU");
    } catch (e) {}
  }
}

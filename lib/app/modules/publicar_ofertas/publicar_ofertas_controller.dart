import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'publicar_ofertas_controller.g.dart';

class PublicarOfertasController = _PublicarOfertasBase
    with _$PublicarOfertasController;

abstract class _PublicarOfertasBase with Store {
  PageController pageController = PageController();

  Future<File> _selectGalleryImage(Size device) async {
    File selected = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    return selected;
  }

  Future<File> _takeCameraImage(Size device) async {
    File selected = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      // maxHeight: device.height - 100,
      // maxWidth: device.width);
    );
    return selected;
  }

  @observable
  File imgFile;

  @observable
  String bs64Cartaz;

  @observable
  int pageIndex = 0;

  @action
  void setPageIndex(int value) {
    pageIndex = value;
    pageController.jumpToPage(value);
  }

  @action
  Future getImage(int value, Size device) async {
    imgFile = null;
    bs64Cartaz = null;
    if (value == 0) {
      imgFile = await _selectGalleryImage(device);
      return imgFile;
    } else if (value == 1) {
      imgFile = await _takeCameraImage(device);
      return imgFile;
    } else {
      // await _selectGalleryImage();
    }
  }
}

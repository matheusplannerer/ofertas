import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'publicar_ofertas_controller.g.dart';

class PublicarOfertasController = _PublicarOfertasBase
    with _$PublicarOfertasController;

abstract class _PublicarOfertasBase with Store {
  PageController pageController = PageController();

  Future<File> _selectGalleryImage() async {
    File selected = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 60);

    return selected;
  }

  Future<File> _takeCameraImage() async {
    File selected = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 60);
    return selected;
  }

  @observable
  int pageIndex = 0;

  @action
  void setPageIndex(int value) {
    pageIndex = value;
    pageController.animateToPage(value,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);

    if (value == 0) {
      _selectGalleryImage();
    } else if (value == 1) {
      _takeCameraImage();
    }
  }
}

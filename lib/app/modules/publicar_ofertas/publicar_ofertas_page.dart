import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_cartaz/publicar_cartaz_page.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_upload/publicar_upload_page.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_controller.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';

class PublicarOfertasPage extends StatefulWidget {
  final String empresaID;
  const PublicarOfertasPage({Key key, this.empresaID}) : super(key: key);

  @override
  _PublicarOfertasPageState createState() => _PublicarOfertasPageState();
}

class _PublicarOfertasPageState extends State<PublicarOfertasPage> {
  var controller = PublicarOfertasController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          // title: Text(titulo),
          gradient: LinearGradient(
            colors: [
              Colors.orange[900],
              Colors.orange[300],
            ],
          ),
        ),
        bottomNavigationBar: Observer(
          builder: (_) {
            return BottomNavigationBar(
              iconSize: 30,
              // selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.grey,
              // selectedIconTheme: IconThemeData(color: Colors.grey, ),
              currentIndex: controller.pageIndex,
              onTap: (index) async {
                controller.setPageIndex(index);
                var x = await controller.getImage(
                    index, MediaQuery.of(context).size);
                print(x);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.photo_album),
                  title: Text(
                    "GALERIA",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.photo_camera),
                  title: Text(
                    "CÂMERA",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.photo_filter),
                  title: Text(
                    "CARTAZ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            );
          },
        ),
        body: Observer(
          builder: (_) {
            return PageView(
              controller: controller.pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                PublicarUploadPage(
                  imgFile: controller.imgFile,
                  empresaID: widget.empresaID,
                ),
                PublicarUploadPage(
                  imgFile: controller.imgFile,
                  empresaID: widget.empresaID,
                ),
                PublicarCartazPage(
                  bs64Img: controller.bs64Cartaz,
                  empresaID: widget.empresaID,
                ),
              ],
            );
          },
        )
        // ListView(
        //   children: <Widget>[
        //     // if (_imageFile != null || base64 != null) ...[
        //     //   if (_imageFile != null) Image.file(_imageFile),
        //     //   if (base64 != null) Image.memory(base64Decode(base64)),
        //     //   if (_imageFile != null)
        //     //     Uploader(
        //     //       file: _imageFile,
        //     //       empresaID: widget.empresaID,
        //     //       produto: produto,
        //     //       clear: _clear,
        //     //     ),
        //     //   if (base64 != null)
        //     //     Uploader(
        //     //       base64: base64,
        //     //       empresaID: widget.empresaID,
        //     //       produto: produto,
        //     //       clear: _clear,
        //     //     ),
        //     // ],
        //   ],
        // ),
        );
  }
}

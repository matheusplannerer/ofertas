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
  File _imageFile;
  String base64;
  OfertaModel produto = OfertaModel();

  Future<void> _pickImage(ImageSource source) async {
    File selected =
        await ImagePicker.pickImage(source: source, imageQuality: 50);

    setState(() {
      _imageFile = selected;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
      base64 = null;
    });
  }

  TextEditingController nome = TextEditingController();
  TextEditingController preco = TextEditingController();
  TextEditingController desconto = TextEditingController();

  var controller = PublicarOfertasController();

  int _index = 0;

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
              var x =
                  await controller.getImage(index, MediaQuery.of(context).size);
              print(x);
            },
            // async {
            // setState(() {

            // });

            // setState(() {
            //   _imageFile = null;
            //   base64 = null;
            // });
            // if (index == 0) {
            //   _pickImage(ImageSource.gallery);
            // } else if (index == 1) {
            //   _pickImage(ImageSource.camera);
            // } else if (index == 2) {
            //   // var result = await Navigator.of(context)
            //   //     .push(MaterialPageRoute(builder: (context) => Cartaz()));
            //   // if (result != null) {
            //   //   base64 = result[0];
            //   //   produto = result[1];
            //   // }
            // }
            // },
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
          print("TESTANDO OFERTA");
          return PageView(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              PublicarUploadPage(
                imgFile: controller.imgFile,
              ),
              PublicarUploadPage(
                imgFile: controller.imgFile,
              ),
              PublicarCartazPage(
                bs64Img: controller.bs64Cartaz,
              ),
            ],
          );
        },
      ),
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

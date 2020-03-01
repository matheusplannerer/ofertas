import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ofertas/app/modules/publicar_ofertas/publicar_ofertas_controller.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';

class PublicarOfertasPage extends StatefulWidget {
  final String title;
  const PublicarOfertasPage({Key key, this.title = "PublicarOfertas"})
      : super(key: key);

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
            selectedItemColor: Colors.orange,
            // selectedIconTheme: IconThemeData(color: Colors.grey, ),
            currentIndex: controller.pageIndex,
            onTap: controller.setPageIndex,
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
      body: PageView(
        controller: controller.pageController,
        children: <Widget>[
          Scaffold(
            body: Text("1"),
          ),
          Scaffold(
            body: Text("2"),
          ),
          Scaffold(
            body: Text("3"),
          ),
        ],
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/publicar_upload/publicar_upload_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';

class PublicarUploadPage extends StatefulWidget {
  final String title;
  final File imgFile;
  const PublicarUploadPage(
      {Key key, this.title = "PublicarUpload", this.imgFile})
      : super(key: key);

  @override
  _PublicarUploadPageState createState() => _PublicarUploadPageState();
}

class _PublicarUploadPageState extends State<PublicarUploadPage> {
  PublicarUploadController controller = PublicarUploadController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.imgFile = widget.imgFile;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        controller.updateImg(widget.imgFile);
        return Scaffold(
          body: ListView(
            children: <Widget>[
              if (controller.imgFile != null)
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        color: Colors.green,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 300,
                        child: Image.file(
                          controller.imgFile,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      ButtonWidget(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 60,
                        onTap: () {
                          Modular.navigatorKey.currentState.pushNamed('');
                        },
                        text: "AVANÇAR",
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

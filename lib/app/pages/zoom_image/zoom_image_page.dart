import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:ui' as ui;
import 'package:photo_view/photo_view_gallery.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class ZoomImage extends StatefulWidget {
  final CachedNetworkImage image;
  ZoomImage(this.image);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ZoomImageState();
  }
}

class _ZoomImageState extends State<ZoomImage> {
  GlobalKey _globalKey = new GlobalKey();

  SolidController _controller = SolidController();

  Future<String> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      print(boundary);
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      print(image);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      print(byteData);
      var pngBytes = byteData.buffer.asUint8List();
      print(pngBytes);
      var bs64 = base64Encode(pngBytes);

      // print(pngBytes);
      print(bs64);

      setState(() {});
      return bs64;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomSheet: SolidBottomSheet(
        headerBar: Container(),
        canUserSwipe: false,
        draggableBody: false,
        autoSwiped: false,
        showOnAppear: false,
        maxHeight: 100,
        controller: _controller,
        body: Container(
          height: 100,
          // color: Colors.red,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 5,
                left: 5,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _controller.hide();
                  },
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.orange),
                        child: Icon(Icons.ac_unit),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Container(
              child: PhotoView(
                minScale: PhotoViewComputedScale.contained,
                imageProvider:
                    CachedNetworkImageProvider(widget.image.imageUrl),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 15,
            child: Container(
              height: 40,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
              child: IconButton(
                iconSize: 25,
                icon: Icon(Icons.close),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          // Positioned(
          //   bottom: 15,
          //   right: 15,
          //   child: Container(
          //     decoration:
          //         BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
          //     child: IconButton(
          //       iconSize: 40,
          //       icon: Icon(Icons.share),
          //       color: Colors.white,
          //       onPressed: () async {
          //         _controller.show();
          //         // var bs64 = await _capturePng();
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

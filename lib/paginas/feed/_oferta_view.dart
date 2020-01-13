import 'package:flutter/material.dart';

class ModeloOfertaView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ModeloOfertaViewState();
  }
}

class _ModeloOfertaViewState extends State<ModeloOfertaView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width * 0.7 - 15,
          color: Colors.red,
          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Image.asset('assets/logo.jpg', fit: BoxFit.cover),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  child: Text("-50%"),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.7 - 15,
          // color: Colors.green,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1),
              left: BorderSide(width: 1),
              right: BorderSide(width: 1),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                " R\$15,00",
                style: TextStyle(
                    fontFamily: "Body",
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " PATINHO MOÍDO 500g",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontFamily: "Body", fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

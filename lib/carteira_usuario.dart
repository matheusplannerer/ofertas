import 'package:flutter/material.dart';

class Carteira extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CarteiraState();
  }
}

class _CarteiraState extends State<Carteira> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("CARTEIRA"),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}

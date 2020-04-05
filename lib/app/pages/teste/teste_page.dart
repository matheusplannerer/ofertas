import 'package:flutter/material.dart';

class TestePage extends StatefulWidget {
  final String title;
  const TestePage({Key key, this.title = "Teste"}) : super(key: key);

  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () async {
              var x;
              try {
                x = await Future.delayed(Duration(seconds: 2), () {
                  return throw Exception('erro');
                });
              } catch (e) {
                print('entrei aqui');
                x = e;
              }
              print(x.runtimeType);
            },
            child: Text("TESTES"),
          )
        ],
      ),
    );
  }
}

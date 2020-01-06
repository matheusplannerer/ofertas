import 'package:flutter/material.dart';
import 'package:ofertas/main.dart';

class EntreEmContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('Entre em contato via nosso e-mail:',
                  style:
                      TextStyle(color: Colors.black, height: 2, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.email),
                  Text('ofertasmogimirim@gmail.com')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

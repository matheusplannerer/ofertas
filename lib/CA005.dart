import 'package:flutter/material.dart';
import 'package:ofertas/CA009.dart';
import 'package:ofertas/models/classes_usuarios.dart';

class CA005 extends StatelessWidget {
  CA005();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Text(
          'CADASTRO',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CA009()));
              },
              child: Image.asset('assets/mogi.jpg', scale: 1),
            ),
          ),
          Text(
            'Verifique seu e-mail',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          Text(
            'Enviamos um link para seu email, é só clicar nele para validar seu cadastro e divulgar suas ofertas  para a cidade inteira!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400]),
          )
        ],
      ),
    );
  }
}

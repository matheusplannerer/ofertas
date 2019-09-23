
import 'package:flutter/material.dart';

class CA003 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Cadastro com Google',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
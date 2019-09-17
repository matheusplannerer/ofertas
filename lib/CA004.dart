import 'package:flutter/material.dart';
import 'package:ofertas/CA002.dart';
import 'package:ofertas/CA005.dart';

class CA004 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CA002()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          '             C A D A S T R O',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'Cadastramento da empresa',
              style: TextStyle(fontSize: 25, color: Colors.grey[800]),
            ),
            Text(
              'Complete as informações abaxio para',
              style: TextStyle(fontSize: 18, color: Colors.grey[400]),
            ),
            Text(
              'realizar seu cadastro.',
              style: TextStyle(fontSize: 18, color: Colors.grey[400]),
            ),
            SizedBox(height: 500),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              minWidth: 250.0,
              height: 50.0,
              child: RaisedButton(
                color: Colors.green[300],
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CA005()));
                },
                child: Text(
                  'Cadastrar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

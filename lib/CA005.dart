import 'package:flutter/material.dart';
import 'package:ofertas/CA004.dart';
import 'package:ofertas/CA009.dart';


class CA005 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CA004()));
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
            SizedBox(height: 150),
            GestureDetector(
                  onTap: () {
                    Navigator.push(
                context, MaterialPageRoute(builder: (context) => CA009()));;
                  },
                  child: Image.asset('assets/mogi.jpg', scale: 1.3),
                ),
            SizedBox(height: 40),
            Text(
              'Verifique seu e-mail',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            ),
            SizedBox(height: 60),
            Container(
              width: MediaQuery.of(context).size.height/2.3,
              child: Text(
                'Enviamos um link para seu email, é só clicar nele para validar seu cadastro e divulgar suas ofertas  para a cidade inteira!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
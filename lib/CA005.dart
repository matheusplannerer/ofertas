import 'package:flutter/material.dart';
import 'package:ofertas/CA009.dart';


class CA005 extends StatelessWidget {
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
          'C A D A S T R O',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CA009()));
              },
              child: Image.asset('assets/mogi.jpg', scale: 1.3),
            ),
            Text(
              'Verifique seu e-mail',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            ),
            Wrap(
              children: <Widget>[
                Text(
                  'Enviamos um link para seu email, é só clicar nele para validar seu cadastro e divulgar suas ofertas  para a cidade inteira!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

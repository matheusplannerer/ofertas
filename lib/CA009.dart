import 'package:flutter/material.dart';
import 'package:ofertas/CA005.dart';

class CA009 extends StatelessWidget {
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
            Image.asset('assets/mogi.jpg', scale: 1.3),
            Text(
              'Cadastro concluído com sucesso',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            ),
            Container(
              width: MediaQuery.of(context).size.height / 2.3,
              child: Text(
                'Agora você já pode divulgar as ofertas da sua empresa para a cidade inteira!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Text(
                'Queremos que sua empresa tenha muito sucesso conosco e como boas vindas, você acaba de ganhar 5 créditos por 6 meses para que muitos clientes fiquem sabendo das suas promoções!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
            ),
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
                      MaterialPageRoute(builder: (context) => CA009()));
                },
                child: Text(
                  'Acessar minha página',
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

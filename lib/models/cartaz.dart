import 'package:flutter/material.dart';
import 'package:ofertas/CA001.dart';
import 'descrição_cartaz.dart';
class CartazPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CA001()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.red[900],
          height: 90.0,
          width: MediaQuery.of(context).size.width,
          child: Text(
            'OFERTA',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 60),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Text('Produto',
                  style: TextStyle(fontSize: 60, color: Colors.blue)),
              Text(
                'Inforções opcionais',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'De:',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    '2,99',
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Por:',
                    style: TextStyle(color: Colors.red, fontSize: 30),
                  ),
                  Text('1,99',
                      style: TextStyle(fontSize: 100, color: Colors.red))
                ],
              ),
              RaisedButton(child: Text('outra pagina la carai'),
             onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => DadosCartaz() ));
             },
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height - 170,
          color: Colors.yellow[400],
        ),
      ]),
    );
  }
}

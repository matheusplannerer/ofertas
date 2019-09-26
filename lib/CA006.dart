import 'package:flutter/material.dart';

class CA006 extends StatelessWidget {
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
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            "E - MAIL VERIFICADO COM SUCESSO!",
            style: TextStyle(fontSize: 25, color: Colors.grey[800]),
          ),
          SizedBox(height: 30),
          Text("Complete as informações abaixo para finalizar seu cadastro.",
              style: TextStyle(fontSize: 25, color: Colors.grey[800])),
          Container(
            width: MediaQuery.of(context).size.height / 2,
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '',
                      labelText: 'Quantidade de unidades',
                    ),
                    onSaved: (String value) {},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '',
                      labelText: 'Nome da Unidade | Unidade 1',
                    ),
                    onSaved: (String value) {},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '(XX) X XXXX-XXXX',
                      labelText: 'Celular',
                    ),
                    onSaved: (String value) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'CA009.dart';

class CA006 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ChecklistPage(),
    );
  }
}

class ChecklistPage extends StatefulWidget {
  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  bool domVal = false;
  bool segVal = false;
  bool terVal = false;
  bool quaVal = false;
  bool quiVal = false;
  bool sexVal = false;
  bool sabVal = false;
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
          Column(
            children: [
              SizedBox(height: 30),
              Text(
                "E - MAIL VERIFICADO COM SUCESSO!",
                style: TextStyle(fontSize: 25, color: Colors.grey[800]),
              ),
              SizedBox(height: 30),
              Text(
                  "Complete as informações abaixo para finalizar seu cadastro.",
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
                          hintText: 'XXXXXXX-XXX',
                          labelText: 'Nome da Unidade | Unidade 1',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'XXXXX-XXX',
                          labelText: 'CEP / Unidade 1',
                        ),
                        onSaved: (String value) {},
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Insira o Logradouro',
                            labelText:
                                'Logradouro (Rua,avenida,etc) / Unidade 1'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2.7,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'XXX',
                                  labelText: 'Numero / Unidade 1',
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  )),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.7,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                ),
                                hintText: 'Insira o complemento',
                                labelText: 'Complemento(ap,etc)/Unidade 1',
                                labelStyle: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'insira o nome do bairro',
                          labelText: 'Bairro / Unidade 1',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2.77,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'XXX',
                                  labelText: 'Estado/Unidade 1',
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  )),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.77,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                ),
                                hintText: 'Insira o país',
                                labelText: 'País/Unidade 1',
                                labelStyle: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 15,
                              child: Column(
                                children: [
                                  Text(
                                    'Domingo',
                                    style: TextStyle(fontSize: 6),
                                  ),
                                  Checkbox(
                                    value: domVal,
                                    onChanged: (bool value) {
                                      setState(
                                        () {
                                          domVal = value;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 15,
                              child: Column(
                                children: [
                                  Text(
                                    'Segunda',
                                    style: TextStyle(fontSize: 6),
                                  ),
                                  Checkbox(
                                    value: segVal,
                                    onChanged: (bool value) {
                                      setState(
                                        () {
                                          segVal = value;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 15,
                              child: Column(
                                children: [
                                  Text(
                                    'Terça',
                                    style: TextStyle(fontSize: 6),
                                  ),
                                  Checkbox(
                                    value: terVal,
                                    onChanged: (bool value) {
                                      setState(
                                        () {
                                          terVal = value;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 15,
                              child: Column(
                                children: [
                                  Text(
                                    'Quarta',
                                    style: TextStyle(fontSize: 6),
                                  ),
                                  Checkbox(
                                    value: quaVal,
                                    onChanged: (bool value) {
                                      setState(
                                        () {
                                          quaVal = value;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 15,
                              child: Column(
                                children: [
                                  Text(
                                    'Quinta',
                                    style: TextStyle(fontSize: 6),
                                  ),
                                  Checkbox(
                                    value: quiVal,
                                    onChanged: (bool value) {
                                      setState(
                                        () {
                                          quiVal = value;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 15,
                              child: Column(
                                children: [
                                  Text(
                                    'Sexta',
                                    style: TextStyle(fontSize: 6),
                                  ),
                                  Checkbox(
                                    value: sexVal,
                                    onChanged: (bool value) {
                                      setState(
                                        () {
                                          sexVal = value;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 15,
                              child: Column(
                                children: [
                                  Text(
                                    'Sabado',
                                    style: TextStyle(fontSize: 6),
                                  ),
                                  Checkbox(
                                    value: sabVal,
                                    onChanged: (bool value) {
                                      setState(
                                        () {
                                          sabVal = value;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Horário', hintText: 'dd:mm'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

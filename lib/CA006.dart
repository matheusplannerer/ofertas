import 'package:flutter/material.dart';
import 'CA0010.dart';

class CA006 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "E-mail verificado com sucesso!",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                SizedBox(height: 30),
                Text(
                    "Complete as informações abaixo para finalizar seu cadastro.",
                    style: TextStyle(fontSize: 20, color: Colors.grey)),
                Container(
                  padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                    width: 325,
                    height: 50,
                    color: Colors.blueGrey[100],
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.person_pin),
                        Text('Upload do Logo da Empresa'),
                        Icon(Icons.photo_size_select_large),
                      ],
                    )),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              width: MediaQuery.of(context).size.width / 2.2,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2.2,
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
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText:
                                  'WhatsApp (número para atendimento ao cliente / Unidade 1',
                              hintText: '(xx)xxxxx-xxxx',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText:
                                  'E-mail (para atendimento ao cliente / Unidade 1',
                              hintText: 'silver@projunior.com.br',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                          child: Text(
                            'Dias em funcionamento / Unidade 1',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                //   child: Row(
                //     children: [
                //       TextFormField(
                //         decoration: const InputDecoration(
                //           labelText: 'Horário de funcionamento / Unidade 1',
                //         ),
                //       ),

                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Wrap(
                  children: [
                    Column(
                      children: <Widget>[
                        Text(
                          'DOM',
                          maxLines: 1,
                          textAlign: TextAlign.center,
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
                    Column(
                      children: <Widget>[
                        Text(
                          'SEG',
                          maxLines: 1,
                          textAlign: TextAlign.center,
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
                    Column(
                      children: <Widget>[
                        Text(
                          'TER',
                          maxLines: 1,
                          textAlign: TextAlign.center,
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
                    Column(
                      children: <Widget>[
                        Text(
                          'QUA',
                          maxLines: 1,
                          textAlign: TextAlign.center,
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
                    Column(
                      children: <Widget>[
                        Text(
                          'QUI',
                          maxLines: 1,
                          textAlign: TextAlign.center,
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
                    Column(
                      children: <Widget>[
                        Text(
                          'SEX',
                          maxLines: 1,
                          textAlign: TextAlign.center,
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
                    Column(
                      children: <Widget>[
                        Text(
                          'SAB',
                          maxLines: 1,
                          textAlign: TextAlign.center,
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
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Site / Unidade 1',
                      hintText: 'www.exemplo.com.br',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome da Unidade / Unidade 1',
                      hintText: 'Pro Junior',
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.lightBlue,
                  child: Text(
                    'CADASTRAR',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CA0010()));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/PE004.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/global/global.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ChecklistPage extends StatefulWidget {
  PerfilEmpresa cadastro;

  ChecklistPage(this.cadastro);

  @override
  _ChecklistPageState createState() => _ChecklistPageState(cadastro);
}

class _ChecklistPageState extends State<ChecklistPage> {
  _ChecklistPageState(this.cadastro);

  PerfilEmpresa cadastro;

  var formKey = GlobalKey<FormState>();

  Services services = Services();

  TextEditingController horaInicio = TextEditingController();
  TextEditingController horaTermino = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
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
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.height / 2,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (String value) {
                            if (value.length >= 1) {
                              return null;
                            } else {
                              return "Campo inválido";
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: '',
                            labelText: 'Quantidade de unidades',
                          ),
                          onSaved: (String value) {
                            cadastro.quantidadeUnides = int.tryParse(value);
                          },
                        ),
                        TextFormField(
                          validator: (String value) {
                            if (value.length >= 3) {
                              return null;
                            } else {
                              return "Campo inválido";
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'XXXXXXX-XXX',
                            labelText: 'Nome da Unidade | Unidade 1',
                          ),
                          onSaved: (String value) {
                            cadastro.nomeUnidade = value.toUpperCase();
                          },
                        ),
                        TextFormField(
                          validator: (String value) {
                            if (value.length >= 3) {
                              return null;
                            } else {
                              return "Campo inválido";
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'XXXXX-XXX',
                            labelText: 'CEP / Unidade 1',
                          ),
                          onSaved: (String value) {
                            cadastro.cep = int.tryParse(value);
                          },
                        ),
                        TextFormField(
                          validator: (String value) {
                            if (value.length >= 3) {
                              return null;
                            } else {
                              return "Campo inválido";
                            }
                          },
                          onSaved: (String value) {
                            cadastro.logradouro = value.toUpperCase();
                          },
                          decoration: const InputDecoration(
                              hintText: 'Insira o Logradouro',
                              labelText: 'Logradouro/Unidade 1'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                validator: (String value) {
                                  if (value.length >= 1) {
                                    return null;
                                  } else {
                                    return "Campo inválido";
                                  }
                                },
                                onSaved: (String value) {
                                  cadastro.numero = value.toUpperCase();
                                },
                                decoration: const InputDecoration(
                                  hintText: 'XXX',
                                  labelText: 'Numero / Unidade 1',
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (String value) {
                                  if (value.length >= 0) {
                                    return null;
                                  } else {
                                    return "Campo inválido";
                                  }
                                },
                                onSaved: (String value) {
                                  cadastro.complemento = value.toUpperCase();
                                },
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                  ),
                                  hintText: 'Insira o complemento',
                                  labelText: 'Complemento',
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          validator: (String value) {
                            if (value.length >= 3) {
                              return null;
                            } else {
                              return "Campo inválido";
                            }
                          },
                          onSaved: (String value) {
                            cadastro.bairro = value.toUpperCase();
                          },
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
                                validator: (String value) {
                                  if (value.length >= 2) {
                                    return null;
                                  } else {
                                    return "Campo inválido";
                                  }
                                },
                                onSaved: (String value) {
                                  cadastro.estado = value.toUpperCase();
                                },
                                decoration: const InputDecoration(
                                  hintText: 'XXX',
                                  labelText: 'Estado/Unidade 1',
                                  labelStyle: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.77,
                              child: TextFormField(
                                validator: (String value) {
                                  if (value.length >= 2) {
                                    return null;
                                  } else {
                                    return "Campo inválido";
                                  }
                                },
                                onSaved: (String value) {
                                  cadastro.pais = value.toUpperCase();
                                },
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
                            validator: (String value) {
                              if (value.length >= 3) {
                                return null;
                              } else {
                                return "Campo inválido";
                              }
                            },
                            onSaved: (String value) {
                              cadastro.telefone = int.tryParse(value);
                            },
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
                            validator: (String value) {
                              if (value.length >= 3) {
                                return null;
                              } else {
                                return "Campo inválido";
                              }
                            },
                            onSaved: (String value) {
                              cadastro.atendEmail = value.toLowerCase();
                            },
                            decoration: const InputDecoration(
                              labelText:
                                  'E-mail (para atendimento ao cliente / Unidade 1',
                              hintText: 'silver@projunior.com.br',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                          child: TextFormField(
                            validator: (String value) {
                              if (value.length >= 3) {
                                return null;
                              } else {
                                return "Campo inválido";
                              }
                            },
                            onSaved: (String value) {
                              cadastro.site = value.toLowerCase();
                            },
                            decoration: const InputDecoration(
                              labelText: 'Site / Unidade 1',
                              hintText: 'www.exemplo.com.br',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                          child: TextFormField(
                            validator: (String value) {
                              if (value.length >= 3) {
                                return null;
                              } else {
                                return "Campo inválido";
                              }
                            },
                            onSaved: (String value) {
                              cadastro.nomeUnidade = value.toUpperCase();
                            },
                            decoration: const InputDecoration(
                              labelText: 'Nome da Unidade / Unidade 1',
                              hintText: 'Pro Junior',
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
                          value: cadastro.funcionamento['domVal'],
                          onChanged: (bool value) {
                            setState(
                              () {
                                cadastro.funcionamento['domVal'] = value;
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
                          value: cadastro.funcionamento['segVal'],
                          onChanged: (bool value) {
                            setState(
                              () {
                                cadastro.funcionamento['segVal'] = value;
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
                          value: cadastro.funcionamento['terVal'],
                          onChanged: (bool value) {
                            setState(
                              () {
                                cadastro.funcionamento['terVal'] = value;
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
                          value: cadastro.funcionamento['quaVal'],
                          onChanged: (bool value) {
                            setState(
                              () {
                                cadastro.funcionamento['quaVal'] = value;
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
                          value: cadastro.funcionamento['quiVal'],
                          onChanged: (bool value) {
                            setState(
                              () {
                                cadastro.funcionamento['quiVal'] = value;
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
                          value: cadastro.funcionamento['sexVal'],
                          onChanged: (bool value) {
                            setState(
                              () {
                                cadastro.funcionamento['sexVal'] = value;
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
                          value: cadastro.funcionamento['sabVal'],
                          onChanged: (bool value) {
                            setState(
                              () {
                                cadastro.funcionamento['sabVal'] = value;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: ListTile(
                  leading: Text("Horário de Atendimento"),
                  trailing: Icon(Icons.timer),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: BasicTimeField(
                  text: "Hora Abertura",
                  controller: horaInicio,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: BasicTimeField(
                  text: "Hora Término",
                  controller: horaTermino,
                ),
              ),
            ],
          ),
          RaisedButton(
            color: Colors.lightBlue,
            child: Text(
              'CADASTRAR',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              cadastro.horaInicio = horaInicio.text;
              cadastro.horaTermino = horaTermino.text;

              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                // print(cadastro.bairro);
                // print(cadastro.cep);
                // print(cadastro.complemento);
                // print(cadastro.estado);
                // print(cadastro.funcionamento);
                // print(cadastro.horaInicio);
                // print(cadastro.horaTermino);
                // print(cadastro.logradouro);
                // print(cadastro.nomeUnidade);
                // print(cadastro.numero);
                // print(cadastro.pais);
                // print(cadastro.quantidadeUnides);
                // print(cadastro.site);
                // print(cadastro.atendEmail);
                // print(cadastro.whatsapp);
                // print(cadastro.razaoSocial);
                // print(cadastro.senha);
                // print(cadastro.telefone);
                // print(cadastro.email);

                showLoadingDialog();
                var fbUser =
                    await services.auth.signUp(cadastro.email, cadastro.senha);
                global.fbUser = fbUser;
                global.empresa = cadastro;
                cadastro.empresaID = fbUser.uid;
                await services.firestore
                    .cadastrarEmpresa(cadastro, global.fbUser);
                hideLoadingDialog();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => PE004()));
              } else {}

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CA0010()));
            },
          )
        ],
      ),
    );
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");

  final String text;
  final TextEditingController controller;
  BasicTimeField({this.text, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(text),
      DateTimePickerFormField(
        textAlign: TextAlign.center,
        inputType: InputType.time,
        controller: controller,
        timePicker: (context) async {
          var horaInicio = await showTimePicker(
            context: context,
            initialTime: TimeOfDay(hour: 7, minute: 0),
          );
          return horaInicio;
        },
        format: format,
      ),
    ]);
  }
}

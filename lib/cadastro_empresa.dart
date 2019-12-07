import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/perfil_empresa.dart';
import 'package:ofertas/perfil_usuario.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/global/global.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CadastroEmpresa extends StatefulWidget {
  // PerfilEmpresa cadastro;

  CadastroEmpresa();

  @override
  _CadastroEmpresaState createState() => _CadastroEmpresaState();
}

class _CadastroEmpresaState extends State<CadastroEmpresa> {
  _CadastroEmpresaState();

  PerfilEmpresa cadastro = PerfilEmpresa();

  var formKey = GlobalKey<FormState>();

  Services services = Services();

  TextEditingController horaInicio = TextEditingController();
  TextEditingController horaTermino = TextEditingController();

  String value;

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "C A D A S T R O",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        gradient:
            LinearGradient(colors: [Colors.orange[900], Colors.orange[300]]),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.orange[900],
      //   title: Text(
      //     'C A D A S T R O',
      //     style: TextStyle(fontSize: 18, color: Colors.white),
      //   ),
      //   centerTitle: true,
      // ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: <Widget>[
          SizedBox(height: 30),
          Text("Complete as informações abaixo para finalizar seu cadastro.",
              style: TextStyle(color: Colors.grey[700], fontSize: 20)),
          SizedBox(height: 20),
          Form(
            key: formKey,
            // autovalidate: true,
            child: Column(
              children: [
                TextFormField(
                  validator: (String value) {
                    if (value.length >= 3) {
                      return null;
                    } else {
                      return "Campo inválido";
                    }
                  },
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    labelText: 'Nome da Unidade',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onSaved: (String value) {
                    cadastro.nomeEmpresa = value.toUpperCase();
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 10),
                DropdownButton(
                  onChanged: (data) {
                    setState(() {
                      value = data;
                    });
                  },
                  value: value,
                  icon: Icon(Icons.list),
                  items: [
                    DropdownMenuItem(
                        child: Text("ACADEMIAS"), value: "ACADEMIAS"),
                    DropdownMenuItem(
                        child: Text("ACESSORIOS PARA LOJAS"),
                        value: "ACESSORIOS PARA LOJAS"),
                    DropdownMenuItem(
                        child: Text("ACESSORIOS PET"), value: "ACESSORIOS PET"),
                    DropdownMenuItem(
                        child: Text("AÇOUGUES E PEIXARIAS"),
                        value: "AÇOUGUES E PEIXARIAS"),
                    DropdownMenuItem(
                        child: Text("ACUPUNTURA"), value: "ACUPUNTURA"),
                    DropdownMenuItem(child: Text("ADEGAS"), value: "ADEGAS"),
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
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide()),
                    labelText: 'CEP',
                  ),
                  onSaved: (String value) {
                    cadastro.cep = int.tryParse(value);
                  },
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                ),
                // TextFormField(
                //   validator: (String value) {
                //     if (value.length >= 3) {
                //       return null;
                //     } else {
                //       return "Campo inválido";
                //     }
                //   },
                //   onSaved: (String value) {
                //     cadastro.logradouro = value.toUpperCase();
                //   },
                //   decoration: const InputDecoration(
                //       hintText: 'Insira o Logradouro',
                //       labelText: 'Logradouro'),
                // ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
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
                        decoration: InputDecoration(
                          labelStyle:
                              TextStyle(color: Colors.grey[700], fontSize: 15),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide()),
                          labelText: 'Numero',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        // validator: (String value) {
                        //   if (value.length >= 1) {
                        //     return null;
                        //   } else {
                        //     return "Campo inválido";
                        //   }
                        // },
                        onSaved: (String value) {
                          cadastro.complemento = value.toUpperCase();
                        },
                        decoration: InputDecoration(
                          labelStyle:
                              TextStyle(color: Colors.grey[700], fontSize: 15),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide()),
                          labelText: 'Complemento',
                        ),
                      ),
                    ),
                  ],
                ),
                // TextFormField(
                //   validator: (String value) {
                //     if (value.length >= 3) {
                //       return null;
                //     } else {
                //       return "Campo inválido";
                //     }
                //   },
                //   onSaved: (String value) {
                //     cadastro.bairro = value.toUpperCase();
                //   },
                //   decoration: const InputDecoration(
                //     hintText: 'insira o nome do bairro',
                //     labelText: 'Bairro',
                //   ),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     Container(
                //       width: MediaQuery.of(context).size.width / 2.2,
                //       child: TextFormField(
                //         validator: (String value) {
                //           if (value.length >= 2) {
                //             return null;
                //           } else {
                //             return "Campo inválido";
                //           }
                //         },
                //         onSaved: (String value) {
                //           cadastro.estado = value.toUpperCase();
                //         },
                //         decoration: const InputDecoration(
                //           hintText: 'XXX',
                //           labelText: 'Estado',
                //           labelStyle: TextStyle(
                //             fontSize: 10,
                //           ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       width: MediaQuery.of(context).size.width / 2.77,
                //       child: TextFormField(
                //         validator: (String value) {
                //           if (value.length >= 2) {
                //             return null;
                //           } else {
                //             return "Campo inválido";
                //           }
                //         },
                //         onSaved: (String value) {
                //           cadastro.pais = value.toUpperCase();
                //         },
                //         decoration: const InputDecoration(
                //           hintStyle: TextStyle(
                //             fontSize: 13,
                //           ),
                //           hintText: 'Insira o país',
                //           labelText: 'País/Unidade 1',
                //           labelStyle: TextStyle(
                //             fontSize: 10,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
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
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide()),
                    labelText: 'Telefone',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.length >= 3) {
                      return null;
                    } else {
                      return "Campo inválido";
                    }
                  },
                  onSaved: (String value) {
                    cadastro.email = value.toLowerCase();
                  },
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide()),
                    labelText: 'E-mail',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                ),
                TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(color: Colors.grey[700], fontSize: 15),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide()),
                    labelText: 'Site',
                  ),
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
                ),

                // Container(
                //   margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
                //   child: Text(
                //     'Dias de funcionamento',
                //     style: TextStyle(color: Colors.grey[700], fontSize: 20),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.grey[700]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(24.0),
                    ),
                  ),
                  child: BasicTimeField(
                    text: "Hora Abertura",
                    controller: horaInicio,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[700]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(24.0),
                    ),
                  ),
                  child: BasicTimeField(
                    text: "Hora Término",
                    controller: horaTermino,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Wrap(
                  spacing: -1,
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
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey[700])),
            textColor: Colors.grey[700],
            padding: EdgeInsets.all(20.0),
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
                // print(cadastro.site);
                // print(cadastro.whatsapp);
                // print(cadastro.telefone);

                showLoadingDialog();
                var empresaID = Firestore.instance
                    .collection("usuarios")
                    .document(global.fbUser.uid)
                    .collection('empresas')
                    .document()
                    .documentID;
                cadastro.empresaID = empresaID;

                await Firestore.instance
                    .collection("empresas")
                    .document(cadastro.empresaID)
                    .setData({
                  "nomeEmpresa": cadastro.nomeEmpresa,
                  "telefone": cadastro.telefone,
                  "email": cadastro.email,
                  "site": cadastro.site,
                  "cep": cadastro.cep,
                  "complemento": cadastro.complemento,
                  "numero": cadastro.numero,
                  "horaInicio": cadastro.horaInicio,
                  "horaTermino": cadastro.horaTermino,
                  "ofertas": 0
                });

                await Firestore.instance
                    .collection("empresas")
                    .document(cadastro.empresaID)
                    .updateData(cadastro.funcionamento);

                await Firestore.instance
                    .collection("usuarios")
                    .document(global.fbUser.uid)
                    .collection('empresas')
                    .document(cadastro.empresaID)
                    .setData({
                  "id": cadastro.empresaID,
                  "nomeEmpresa": cadastro.nomeEmpresa
                });

                hideLoadingDialog();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        PerfilEmpresaPage(cadastro.empresaID)));
              } else {}

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CA0010()));
            },
            child: Text(
              "CADASTRAR",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
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
    return Column(
      children: <Widget>[
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
        Text(text),
      ],
    );
  }
}

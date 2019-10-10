import 'package:flutter/material.dart';
import 'package:ofertas/CA001.dart';
import 'package:ofertas/CA006.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CA004 extends StatefulWidget {
  @override
  _CA004State createState() => _CA004State();
}

class _CA004State extends State<CA004> {
  var formKey = GlobalKey<FormState>();
  Services services = Services();
  bool checkbox = false;
  PerfilEmpresa precadastro = PerfilEmpresa();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Text(
          'CADASTRO',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: 30),
                Text(
                  'Cadastro da empresa',
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
                Wrap(
                  children: <Widget>[
                    Text(
                      'Complete as informações abaixo para Realizar seu cadastro',
                      style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.height / 2,
                  child: Form(
                    key: formKey,
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
                          decoration: const InputDecoration(
                            hintText: '',
                            labelText: 'Razão social da empresa',
                          ),
                          onSaved: (String value) {
                            precadastro.razaoSocial = value;
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
                            hintText: 'trocar por uma lista',
                            labelText: 'Categoria principal de atuação',
                          ),
                          onSaved: (String value) {},
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
                            hintText: 'XXXXXXX-XXXX',
                            labelText: 'Celular para contato',
                          ),
                          onSaved: (String value) {
                            precadastro.whatsapp = int.tryParse(value);
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
                            hintText: '',
                            labelText: 'E-mail',
                          ),
                          onSaved: (String value) {
                            precadastro.email = value;
                          },
                        ),
                        TextFormField(
                          validator: (String value) {
                            if (value.length >= 6) {
                              return null;
                            } else {
                              return "Campo inválido";
                            }
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Mínimo de 6 caracteres',
                            labelText: 'Senha',
                          ),
                          onSaved: (String value) {
                            precadastro.senha = value;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (String value) {
                            if (value.length >= 3) {
                              return null;
                            } else {
                              return "Campo inválido";
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: 'Confirme sua senha',
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: checkbox,
                              onChanged: (bool value) {
                                setState(
                                  () {
                                    checkbox = value;
                                  },
                                );
                              },
                            ),
                            Text('Li e concordo com os termos'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                  minWidth: 250.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.blueGrey[200],
                    textColor: Colors.white,
                    onPressed: () {
                      if (formKey.currentState.validate() && checkbox) {
                        formKey.currentState.save();
                        print(precadastro.razaoSocial);
                        print(precadastro.whatsapp);
                        print(precadastro.email);
                        print(precadastro.senha);

                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ChecklistPage(precadastro);
                        }));
                      } else {}
                    },
                    child: Text(
                      'CONTINUAR',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

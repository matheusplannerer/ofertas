import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/CA001.dart';
import 'package:ofertas/CA005.dart';
import 'package:ofertas/Dashboard.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:provider/provider.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool checkbox = false;
  User usuario = User();

  String confirmaSenha = '';

  Services services = Services();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    return Scaffold(
      appBar: AppBar(
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
                  'NOVO PERFIL',
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
                Wrap(
                  children: <Widget>[
                    Text(
                      'Complete as informações abaixo para realizar seu cadastro',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
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
                          decoration: const InputDecoration(
                            labelText: 'NOME COMPLETO',
                          ),
                          onSaved: (String value) {
                            usuario.nome = value.toUpperCase();
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "(DDD) XXXXX-XXXX",
                            labelText: 'CONTATO',
                          ),
                          onSaved: (String value) {
                            usuario.celular = value.toLowerCase();
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'E-MAIL',
                          ),
                          onSaved: (String value) {
                            usuario.email = value.toLowerCase();
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText:
                                'Mínimo de 6 caracteres e ao menos 1 número',
                            labelText: 'Senha (utilizado para acesso ao app)',
                          ),
                          onSaved: (String value) {
                            usuario.senha = value;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Confirme sua senha',
                          ),
                          obscureText: true,
                          onSaved: (String value) {
                            confirmaSenha = value;
                          },
                        ),
                        // TextFormField(
                        //   decoration: const InputDecoration(
                        //     hintText: 'XXX.XXX.XXX-XX',
                        //     labelText: 'CPF',
                        //   ),
                        //   onSaved: (String value) {
                        //     usuario.cpf = value;
                        //   },
                        // ),
                        // TextFormField(
                        //   decoration: const InputDecoration(
                        //     hintText: '(XX) X XXXX-XXXX',
                        //     labelText: 'Celular',
                        //   ),
                        //   onSaved: (String value) {
                        //     usuario.celular = value;
                        //   },
                        // ),
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
                RaisedButton(
                  color: Colors.blueGrey[200],
                  textColor: Colors.white,
                  onPressed: () async {
                    if (checkbox) {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (confirmaSenha == usuario.senha) {
                          print(usuario.email);
                          print(usuario.nome);
                          print(usuario.celular);
                          print(usuario.senha);

                          showLoadingDialog();
                          var fbUser = await services.auth
                              .signUp(usuario.email, usuario.senha);
                          global.fbUser = fbUser;
                          usuario.usuarioID = global.fbUser.uid;
                          await services.firestore.cadastrarUsuario(usuario);
                          global.usuario = usuario;
                          await fbUser.sendEmailVerification();
                          hideLoadingDialog();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Dashboard()));

                        } else{

                        }
                      }
                    }
                  },
                  child: Text(
                    'CADASTRAR',
                    style: TextStyle(fontSize: 20),
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

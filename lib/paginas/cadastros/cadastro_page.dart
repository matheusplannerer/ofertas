import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/paginas/feed/dashboard.dart';
import 'package:provider/provider.dart';

import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../global/global.dart';

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
      backgroundColor: Colors.white,
      appBar: GradientAppBar(
        title: Text(
          "CADASTRO",
          style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(45),
              fontFamily: "Poppins-Bold",
              color: Colors.white,
              letterSpacing: .6),
        ),
        centerTitle: true,
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.height / 2,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                          labelStyle:
                              TextStyle(color: Colors.black38, fontSize: 15),
                          labelText: 'Nome completo',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                          ),
                          onSaved: (String value) {
                            usuario.nome = value.toUpperCase();
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(                          
                            labelStyle:
                              TextStyle(color: Colors.black38, fontSize: 15),
                          labelText: 'Contato',
                          hintText: '(DDD) XXXXX-XXXX',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                          ),
                          onSaved: (String value) {
                            usuario.celular = value.toLowerCase();
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(                          
                            labelStyle:
                              TextStyle(color: Colors.black38, fontSize: 15),
                          labelText: 'E-mail',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                          ),
                          onSaved: (String value) {
                            usuario.email = value.toLowerCase();
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(                          
                            labelStyle:
                              TextStyle(color: Colors.black38, fontSize: 15),
                          labelText: 'Senha (utilizado para acesso ao app)',
                          hintText:
                                'Mínimo de 6 caracteres e ao menos 1 número',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
                          ),
                          onSaved: (String value) {
                            usuario.senha = value;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black38, fontSize: 15),
                          labelText: 'Confirme sua senha',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(),
                          ),
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
                 
             Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(15),
                  ),
                  
               Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFF8A65),
                                Color(0xFFFF5722),
                                Color(0xFFD84315)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF6078ea).withOpacity(.3),
                                  offset: Offset(0.0, 8.0),
                                  blurRadius: 8.0)
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                  onTap: () async { // antes era onPressed, não sei se muda algo
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
                 child: Center(
                                child: Text(
                                  "AVANÇAR",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Bold",
                                      fontSize: 18,
                                      letterSpacing: 1.0),
                                ),
                ),
                ),
                          ),
                        ),
                        ),
              ],
            ),
          ],
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

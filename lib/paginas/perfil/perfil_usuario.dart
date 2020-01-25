import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/paginas/cadastros/cadastro_empresa.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class PerfilUsuario extends StatefulWidget {
  PerfilUsuario();

  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> empresas = [];

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    return FutureBuilder<DocumentSnapshot>(
      future: Firestore.instance
          .collection('usuarios')
          .document(global.fbUser.uid)
          .get(),
      builder: (context, aux) {
        if (aux.connectionState ==
            ConnectionState.waiting) //Se tiver conectando
        {
          print('travou aqui');

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        User usuario = User.fromJson(aux.data.data);
        if (aux.hasData &&
            usuario.empresaPerfil != null &&
            usuario.empresaPerfil != '') {
          //CASO TENHA USUARIO COM UMA EMPRESA PERFIL
          return FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance
                .collection('empresas')
                .document(usuario.empresaPerfil)
                .get(),
            builder: (context, auxDois) {
              if (auxDois.connectionState == ConnectionState.waiting)
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              if (auxDois.hasData) {
                print("PASSOU AQUI");
                PerfilEmpresa empresa = PerfilEmpresa.fromJson(
                  auxDois.data.data,
                  auxDois.data.documentID,
                );
                return PerfilEmpresaPage(empresa);
              }

              return Center();
            },
          );
        }

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("NENHUMA EMPRESA CADASTRADA"),
                RaisedButton(
                  child: Text("CADASTRAR EMPRESA"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CadastroEmpresa()));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

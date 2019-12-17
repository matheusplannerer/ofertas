import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ofertas/CA002.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/cadastro_empresa.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/perfil_empresa.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class PerfilUsuario extends StatefulWidget {
  PerfilUsuario({Key key}) : super(key: key);

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
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection('usuarios')
                .document(global.fbUser.uid)
                .collection("empresas")
                .getDocuments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.data.documentChanges.length > 0) {
                  empresas = [];
                  for (var i = 0;
                      i < snapshot.data.documentChanges.length;
                      i++) {
                    empresas.add(
                      ListTile(
                        title: Text(snapshot
                            .data.documentChanges[i].document['nomeEmpresa']),
                        onTap: () {
                          print(snapshot.data.documentChanges);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PerfilEmpresaPage(
                                  snapshot.data.documentChanges[i].document
                                      .documentID)));
                          // PerfilEmpresaPage(snapshot
                          //     .data
                          //     .documentChanges[i]
                          //     .document
                          //     .documentID)));
                        },
                      ),
                    );
                  }
                  empresas.add(
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CadastroEmpresa()));
                      },
                      child: Text("ADICIONAR EMPRESA"),
                    ),
                  );
                  return Column(
                    children: <Widget>[...empresas],
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Text("NENHUMA EMPRESA CADASTRADA"),
                        RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CadastroEmpresa()));
                          },
                          child: Text("ADICIONAR EMPRESA"),
                        )
                      ],
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

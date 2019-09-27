import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Teste extends StatelessWidget {
  //PARTE DE AUTENTICAÇÃO
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> cadastrar() async {}

  //PARTE DE DATABASE
  Firestore firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text("TESTE"),
          onPressed: () async {
            await firebaseAuth.signInWithEmailAndPassword(
                email: "brunoarantes30@gmail.com", password: "Batata123");

            print("LOGADO");

            var informacoes = await firebaseAuth.currentUser();

            var documento = await firestore
                .collection('usuarios')
                .document(informacoes.uid)
                .get();

            print(documento.data['nome']);
          },
        ),
      ),
    );
  }
}

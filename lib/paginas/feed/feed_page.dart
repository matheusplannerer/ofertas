import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/feed/_empresa_header_view.dart';
import 'package:ofertas/paginas/feed/_oferta_e_header_view.dart';
import 'package:ofertas/paginas/feed/_oferta_view.dart';

class FeedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FeedPageState();
  }
}

class _FeedPageState extends State<FeedPage> {
  bool incrementou = false;

  bool hasMore = true;

  QuerySnapshot querySnapshot;
  DocumentSnapshot lastDocument;
  int queryLimit;

  List<PerfilEmpresa> empresas;
  List<OfertaModel> ofertas;

  ScrollController _scrollController = ScrollController();

  Stream<QuerySnapshot> stream;

  getOfertas() async {
    if (lastDocument == null) {
      print("LAST DOC");
      var doc = await Firestore.instance
          .collection('empresas')
          .limit(queryLimit)
          .getDocuments();
      for (var i = 0; i < doc.documents.length; i++) {
        PerfilEmpresa aux = PerfilEmpresa.fromJson(
            doc.documents[i].data, doc.documents[i].documentID);
        var oferta = await Firestore.instance
            .collection('ofertas')
            .where('empresaDona', isEqualTo: aux.empresaID)
            .limit(1)
            .getDocuments();

        if (oferta.documents.length > 0) {
          setState(() {
            empresas.add(aux);
          });
        }
      }
      lastDocument = doc.documents[doc.documents.length - 1];
    } else {
      if (hasMore) {
        var doc = await Firestore.instance
            .collection('empresas')
            .limit(queryLimit)
            .startAfterDocument(lastDocument)
            .getDocuments();

        if (doc.documents.length > 0) {
          hasMore = true;

          for (var i = 0; i < doc.documents.length; i++) {
            PerfilEmpresa aux = PerfilEmpresa.fromJson(
                doc.documents[i].data, doc.documents[i].documentID);

            setState(() {
              empresas.add(aux);
            });
          }
          lastDocument = doc.documents[doc.documents.length - 1];
        } else {
          hasMore = false;
        }
      }
    }
  }

  @override
  void initState() {
    queryLimit = 8;
    empresas = [];
    ofertas = [];

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getOfertas();
      }
    });
    getOfertas();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // return ListView(
    //   children: <Widget>[
    //     ViewFeed(),
    //   ],
    // );

    return ListView.builder(
      itemCount: empresas.length == 0 ? 1 : empresas.length,
      controller: _scrollController,
      itemBuilder: (context, i) {
        if (empresas.length == 0) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else
          return ViewFeed(
            empresa: empresas[i],
          );
      },
    );
  }
}

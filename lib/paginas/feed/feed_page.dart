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

        setState(() {
          empresas.add(aux);
        });
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
    queryLimit = 2;
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

    // return StreamBuilder<QuerySnapshot>(
    //   stream: stream,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       if (snapshot.data.documents.length > 0) {
    //         // print(snapshot.data.documents);
    //         hasMore = true;
    //         for (var i = 0; i < snapshot.data.documents.length; i++) {
    //           PerfilEmpresa aux = PerfilEmpresa.fromJson(
    //               snapshot.data.documents[i].data,
    //               snapshot.data.documents[i].documentID);
    //           print("ADICINOU EMPRESA $i");
    //           empresas.add(aux);
    //         }

    //         lastDocument =
    //             snapshot.data.documents[snapshot.data.documents.length - 1];

    //         // querySnapshot = snapshot.data;
    //       } else {
    //         hasMore = false;
    //       }

    //       return ListView.builder(
    //         controller: _scrollController,
    //         itemCount: empresas.length,
    //         itemBuilder: (context, i) {
    //           return Container(
    //             height: MediaQuery.of(context).size.height + 100,
    //             child: Center(
    //               child: Text("empresa $i"),
    //             ),
    //           );
    //         },
    //       );
    //     } else {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // );
  }
}

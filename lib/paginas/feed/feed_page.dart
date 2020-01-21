import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/feed/_empresa_header_view.dart';
import 'package:ofertas/paginas/feed/_oferta_e_header_view.dart';
import 'package:ofertas/paginas/feed/_oferta_view.dart';

class FeedPage extends StatefulWidget {
  FeedPage({this.filtro});
  final String filtro;

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

  bool carregou = false;

  String filtro;

  ScrollController _scrollController = ScrollController();

  Stream<QuerySnapshot> stream;

  getEmpresasFiltradas() async {
    if (lastDocument == null) {
      // print("LAST DOC");
      var doc = await Firestore.instance
          .collection('empresas')
          .where('categoria', isEqualTo: filtro)
          .limit(queryLimit)
          .getDocuments();
      print(doc.documents.length);
      for (var i = 0; i < doc.documents.length; i++) {
        PerfilEmpresa aux = PerfilEmpresa.fromJson(
            doc.documents[i].data, doc.documents[i].documentID);

        var docAux = await Firestore.instance
            .collection('ofertas')
            .where('empresaDona', isEqualTo: aux.empresaID)
            .limit(1)
            .getDocuments();

        if (docAux.documents.length > 0) {
          setState(() {
            empresas.add(aux);
          });
        }
      }
      if (doc.documents.length > 0)
        lastDocument = doc.documents[doc.documents.length - 1];
    } else {
      if (hasMore) {
        var doc = await Firestore.instance
            .collection('empresas')
            .where('categoria', isEqualTo: filtro)
            .limit(queryLimit)
            .startAfterDocument(lastDocument)
            .getDocuments();

        if (doc.documents.length > 0) {
          hasMore = true;

          for (var i = 0; i < doc.documents.length; i++) {
            PerfilEmpresa aux = PerfilEmpresa.fromJson(
                doc.documents[i].data, doc.documents[i].documentID);

            var docAux = await Firestore.instance
                .collection('ofertas')
                .where('empresaDona', isEqualTo: aux.empresaID)
                .limit(1)
                .getDocuments();

            if (docAux.documents.length > 0) {
              setState(() {
                empresas.add(aux);
              });
            }
          }
          if (doc.documents.length > 0)
            lastDocument = doc.documents[doc.documents.length - 1];
        } else {
          hasMore = false;
        }
      }
    }

    setState(() {
      carregou = true;
    });
  }

  getEmpresas() async {
    if (lastDocument == null) {
      print("LAST DOC");
      var doc = await Firestore.instance
          .collection('empresas')
          .limit(queryLimit)
          .getDocuments();
      for (var i = 0; i < doc.documents.length; i++) {
        PerfilEmpresa aux = PerfilEmpresa.fromJson(
            doc.documents[i].data, doc.documents[i].documentID);

        var docAux = await Firestore.instance
            .collection('ofertas')
            .where('empresaDona', isEqualTo: aux.empresaID)
            .limit(1)
            .getDocuments();

        if (docAux.documents.length > 0) {
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

            var docAux = await Firestore.instance
                .collection('ofertas')
                .where('empresaDona', isEqualTo: aux.empresaID)
                .limit(1)
                .getDocuments();

            if (docAux.documents.length > 0) {
              setState(() {
                empresas.add(aux);
              });
            }
          }
          lastDocument = doc.documents[doc.documents.length - 1];
        } else {
          hasMore = false;
        }
      }
    }

    setState(() {
      carregou = true;
    });
  }

  @override
  void initState() {
    queryLimit = 8;
    empresas = [];
    ofertas = [];
    filtro = widget.filtro;
    print(filtro);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (filtro != null)
          getEmpresasFiltradas();
        else
          getEmpresas();
      }
    });
    if (filtro != null)
      getEmpresasFiltradas();
    else
      getEmpresas();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (filtro != null) {
      return Scaffold(
        appBar: GradientAppBar(
          centerTitle: true,
          title: Text(
            filtro.toUpperCase(),
            style: TextStyle(
              fontSize: 22,
              fontFamily: "Poppins-Bold",
              color: Colors.white,
              letterSpacing: .6,
            ),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.orange[900],
              Colors.orange[300],
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: empresas.length == 0 ? 1 : empresas.length,
          controller: _scrollController,
          itemBuilder: (context, i) {
            if (empresas.length == 0) {
              if (!carregou) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text("Sem empresas cadastradas no filtro desejado"),
                );
              }
            } else
              return ViewFeed(
                empresa: empresas[i],
              );
          },
        ),
      );
    } else {
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
}

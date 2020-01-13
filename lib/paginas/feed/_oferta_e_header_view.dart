import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/feed/_empresa_header_view.dart';
import 'package:ofertas/paginas/feed/_oferta_view.dart';
import 'package:ofertas/paginas/feed/oferta_detalhes.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';

class ViewFeed extends StatefulWidget {
  ViewFeed({this.empresa});
  final PerfilEmpresa empresa;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ViewFeedState();
  }
}

class _ViewFeedState extends State<ViewFeed> {
  List<OfertaModel> ofertas = [];

  ScrollController _scrollController = ScrollController();

  bool hasMore = true;

  DocumentSnapshot lastDocument;

  int queryLimit = 12;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      // if (_scrollController.position.pixels ==
      //     _scrollController.position.maxScrollExtent) {
      //       print("GET OF");
      // }
    });
    getOfertas();
    super.initState();
  }

  void getOfertas() async {
    if (hasMore) {
      if (lastDocument == null) {
        var doc = await Firestore.instance
            .collection('ofertas')
            .limit(queryLimit)
            .where("empresaDona", isEqualTo: widget.empresa.empresaID)
            .getDocuments();
        if (doc.documents.length > 0) {
          for (var i = 0; i < doc.documents.length; i++) {
            OfertaModel aux = OfertaModel.fromJson(
                doc.documents[i].data, doc.documents[i].documentID);

            setState(() {
              ofertas.add(aux);
            });
          }
          lastDocument = doc.documents[doc.documents.length - 1];
        } else {
          ofertas = [];
        }
      } else {
        var doc = await Firestore.instance
            .collection('ofertas')
            .limit(queryLimit)
            .startAfterDocument(lastDocument)
            .where("empresaDona", isEqualTo: widget.empresa.empresaID)
            .getDocuments();
        if (doc.documents.length > 0) {
          for (var i = 0; i < doc.documents.length; i++) {
            OfertaModel aux = OfertaModel.fromJson(
                doc.documents[i].data, doc.documents[i].documentID);

            setState(() {
              ofertas.add(aux);
            });
          }
          lastDocument = doc.documents[doc.documents.length - 1];
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(width: 1),
              top: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
              right: BorderSide(width: 1),
            ),
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: 80,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PerfilEmpresaPage(widget.empresa.empresaID)));
            },
            child: HeaderEmpresaView(empresa: widget.empresa),
          ),
        ),
        Container(
          height: 5,
          color: Colors.white,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 140,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (ofertas.length == null || ofertas.length == 0)
                ? 1
                : ofertas.length,
            controller: _scrollController,
            itemBuilder: (context, i) {
              if (ofertas.length == 0 && hasMore) {
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (ofertas.length == 0) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("SEM OFERTAS PUBLICADAS"),
                  ),
                );
              }
              return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                width: MediaQuery.of(context).size.width * 0.6 - 15,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OfertaDetalhe(
                                  empresaID: widget.empresa.empresaID,
                                  produto: ofertas[i],
                                )));
                      },
                      child: ModeloOfertaView(produto: ofertas[i]),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

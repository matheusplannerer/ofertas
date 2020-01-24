import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
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

            if (mounted)
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
            if (mounted)
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
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            // color: Colors.orange[200],
            border: Border(
              top: BorderSide(color: Colors.grey[200], width: 5),
            ),
          ),
          child: ListTile(
            title: Text(widget.empresa.nomeEmpresa),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.orange,
            ),
            onTap: () async {
              showLoadingDialog(tapDismiss: false);
              var doc = await Firestore.instance
                  .collection('empresas')
                  .document(widget.empresa.empresaID)
                  .get()
                  .timeout(Duration(seconds: 15));
              hideLoadingDialog();
              if (doc != null) {
                PerfilEmpresa aux =
                    PerfilEmpresa.fromJson(doc.data, doc.documentID);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PerfilEmpresaPage(aux)));
              }
            },
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: widget.empresa.foto != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.empresa.foto,
                      ),
                    )
                  : CircleAvatar(
                      backgroundImage: AssetImage('assets/mogi.jpg'),
                    ),
            ),
          ),
        ),
        Container(
          height: 10,
          color: Colors.white,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 140,
          // color: Colors.green,
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
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
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          OfertaDetalhe(produto: ofertas[i])));
                },
                child: ModeloOfertaView(
                  produto: ofertas[i],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}

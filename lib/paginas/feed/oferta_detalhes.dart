import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:load/load.dart';
import 'package:ofertas/controller/services.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';
import 'package:provider/provider.dart';

class OfertaDetalhe extends StatefulWidget {
  OfertaDetalhe({this.produto});
  final OfertaModel produto;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OfertaDetalheState();
  }
}

class _OfertaDetalheState extends State<OfertaDetalhe> {
  bool isCartaz = false; //Cartaz digital
  bool isFolheto = false; //Folheto

  bool isOwner = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.produto.preco == "0,00") {
      isCartaz = false;
      isFolheto = true;
    }
    if (widget.produto.preco == null) {
      isCartaz = true;
      isFolheto = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    if (widget.produto.empresaDona == global.empresaLogada.empresaID) {
      isOwner = true;
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          if (isOwner)
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () async {
                var deletar = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: IconButton(
                          alignment: Alignment.centerLeft,
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text("DELETAR IMAGEM"),
                                onTap: () {
                                  Navigator.of(context).pop(true);
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    });
                if (deletar) {
                  showLoadingDialog();
                  var confirm = await Services().firestore.deleteImage(
                      global.fbUser,
                      global.empresaLogada,
                      widget.produto.idOferta);
                  hideLoadingDialog();
                  if (confirm) {
                    Navigator.of(context)
                        .popUntil((Route<dynamic> route) => route.isFirst);
                  }
                }
              },
            )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl: widget.produto.imagem,
                      fit: BoxFit.fill,
                      errorWidget: (context, string, obj) {
                        return Center(
                          child: Text("ERRO NO CARREGAMENTO"),
                        );
                      },
                      placeholder: (context, url) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    height: 275,
                  ),
                  Positioned(
                    child: IconButton(
                      icon: Icon(Icons.local_mall),
                      iconSize: 40,
                      color: Colors.orange,
                      onPressed: () async {
                        showLoadingDialog(tapDismiss: false);
                        var doc = await Firestore.instance
                            .collection('empresas')
                            .document(widget.produto.empresaDona)
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
                    ),
                    bottom: 0,
                    right: 0,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: widget.produto.validade != null
                    ? Text(
                        "Oferta válida até: " +
                            DateFormat("dd/MM/yy")
                                .format(widget.produto.validade.toDate()),
                        style: TextStyle(
                            // fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey),
                      )
                    : Text(
                        "Oferta válida até: indefinido",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                            color: Colors.black),
                      ),
              ),
              if (widget.produto.nomeProduto != '' &&
                  widget.produto.nomeProduto != null)
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: Text(
                    widget.produto.nomeProduto,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 10, 15),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (isCartaz || (!isCartaz && !isFolheto))
                          Text(
                            "Preço com desconto: ${widget.produto.desconto}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          ),
                        if (!isFolheto && !isCartaz)
                          Text(
                            "R\$ " + widget.produto.preco,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        child: Text(
                          widget.produto.infos,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/drawer/entreemcontato.dart';
import 'package:ofertas/paginas/drawer/planos.dart';
import 'package:ofertas/paginas/feed/_empresa_header_view.dart';
import 'package:ofertas/paginas/feed/_oferta_e_header_view.dart';
import 'package:ofertas/paginas/feed/_oferta_view.dart';
import 'package:ofertas/paginas/feed/categorias.dart';
import 'package:ofertas/paginas/feed/dashboard.dart';
import 'package:ofertas/paginas/login/entrar.dart';
import 'package:provider/provider.dart';

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

  bool noEmpresas = false;

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
          if (mounted)
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
              if (mounted)
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
    if (mounted)
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
          if (mounted)
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
              if (mounted)
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
    if (mounted)
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

    Future.delayed(Duration(seconds: 15)).then((data) {
      if (empresas.length == 0) {
        if (mounted)
          setState(() {
            noEmpresas = true;
          });
      } else {
        if (mounted)
          setState(() {
            noEmpresas = false;
          });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var global = Provider.of<Global>(context);
    if (filtro != null) {
      return Scaffold(
        appBar: GradientAppBar(
          centerTitle: true,
          // elevation: 0,
          // backgroundColor: primaryColor,
          title: Text(
            'OFERTAS',
            style: TextStyle(
                fontSize: 22,
                fontFamily: "Poppins-Bold",
                color: Colors.white,
                letterSpacing: .6),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.orange[900],
              Colors.orange[300],
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoriasPage()));
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              if (global.fbUser == null)
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.store,
                          color: Colors.orange.shade600, size: 30),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Entrar como empresa',
                          style: TextStyle(
                              fontFamily: "Domine-Bold",
                              fontSize: 16,
                              color: Colors.black87,
                              letterSpacing: .3),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Entrar()));
                  },
                ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.chat_bubble_outline,
                        color: Colors.orange.shade500, size: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Entre em contato',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EntreEmContato()));
                },
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.group_add,
                      color: Colors.orange.shade600,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Indique o App',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => Carteira()));
                // },
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.star_border,
                        color: Colors.orange.shade400, size: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Avalie o app',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_satisfied,
                        color: Colors.orange.shade600, size: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Assine já',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Planos()));
                },
              ),
              Divider(),
              if (global.fbUser != null)
                ListTile(
                  trailing:
                      Icon(Icons.arrow_back, color: Colors.orange.shade400),
                  title: Text(
                    'SAIR',
                    style: TextStyle(
                        fontFamily: "Domine-Bold",
                        fontSize: 16,
                        color: Colors.black87,
                        letterSpacing: .3),
                  ),
                  onTap: () async {
                    Navigator.of(context).pop();
                    showLoadingDialog();
                    await Future.delayed(Duration(milliseconds: 400));
                    global.isEmpresa = false;
                    await FirebaseAuth.instance.signOut();
                    hideLoadingDialog();
                    global.fbUser = null;
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                ),
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
      return Scaffold(
        appBar: GradientAppBar(
          centerTitle: true,
          // elevation: 0,
          // backgroundColor: primaryColor,
          title: Text(
            'OFERTAS',
            style: TextStyle(
                fontSize: 22,
                fontFamily: "Poppins-Bold",
                color: Colors.white,
                letterSpacing: .6),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.orange[900],
              Colors.orange[300],
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoriasPage()));
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              if (global.fbUser == null)
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.store,
                          color: Colors.orange.shade600, size: 30),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Entrar como empresa',
                          style: TextStyle(
                              fontFamily: "Domine-Bold",
                              fontSize: 16,
                              color: Colors.black87,
                              letterSpacing: .3),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Entrar()));
                  },
                ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.chat_bubble_outline,
                        color: Colors.orange.shade500, size: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Entre em contato',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EntreEmContato()));
                },
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.group_add,
                      color: Colors.orange.shade600,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Indique o App',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => Carteira()));
                // },
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.star_border,
                        color: Colors.orange.shade400, size: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Avalie o app',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_satisfied,
                        color: Colors.orange.shade600, size: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Assine já',
                        style: TextStyle(
                            fontFamily: "Domine-Bold",
                            fontSize: 16,
                            color: Colors.black87,
                            letterSpacing: .3),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Planos()));
                },
              ),
              Divider(),
              if (global.fbUser != null)
                ListTile(
                  trailing:
                      Icon(Icons.arrow_back, color: Colors.orange.shade400),
                  title: Text(
                    'SAIR',
                    style: TextStyle(
                        fontFamily: "Domine-Bold",
                        fontSize: 16,
                        color: Colors.black87,
                        letterSpacing: .3),
                  ),
                  onTap: () async {
                    Navigator.of(context).pop();
                    showLoadingDialog();
                    await Future.delayed(Duration(milliseconds: 400));
                    global.isEmpresa = false;
                    await FirebaseAuth.instance.signOut();
                    hideLoadingDialog();
                    global.fbUser = null;
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: empresas.length == 0 ? 1 : empresas.length,
          controller: _scrollController,
          itemBuilder: (context, i) {
            if (!noEmpresas) {
              if (empresas.length == 0) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                return ViewFeed(
                  empresa: empresas[i],
                );
            } else {
              return Center(
                child: Text("TENTE NOVAMENTE MAIS TARDE."),
              );
            }
          },
        ),
      );
    }
  }
}

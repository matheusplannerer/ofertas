import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/crop.dart';
import 'package:ofertas/teste.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PerfilEmpresaTestePage extends StatefulWidget {
  PerfilEmpresaTestePage(this.empresaID);
  String empresaID;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PerfilEmpresaTestePageState(empresaID);
  }
}

class _PerfilEmpresaTestePageState extends State<PerfilEmpresaTestePage> {
  double _rating = 4;
  String empresaID;

  StorageReference ref = FirebaseStorage.instance.ref().child("cartaz2.jpg");

  String foto = '';

  bool puxouFotos = false;

  _PerfilEmpresaTestePageState(this.empresaID);

  Future<String> getFoto() async {
    foto = await ref.getDownloadURL();
    setState(() {
      puxouFotos = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(empresaID);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[],
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance
              .collection('empresas')
              .document(empresaID)
              .get(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 125,
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: AssetImage("logo.jpg"),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Text("Clebinho", textScaleFactor: 1.25,)
                                  Text(
                                    snapshot.data.data['nomeEmpresa'],
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  SmoothStarRating(
                                    allowHalfRating: false,
                                    onRatingChanged: (v) {
                                      setState(() {
                                        _rating = v;
                                      });
                                    },
                                    starCount: 5,
                                    rating: _rating,
                                    size: 27.0,
                                    color: Colors.orange,
                                    borderColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "$_rating",
                                    textScaleFactor: 2,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                          IconButton(
                            onPressed: () async {
                              await showDialog(
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Endereço:"),
                                      content: Text(""),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("CONFIRMAR"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  },
                                  context: context);
                            },
                            icon: Icon(Icons.pin_drop, size: 40),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                          IconButton(
                            onPressed: () async {
                              await showDialog(
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Contato:"),
                                      content: Text(""),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("CONFIRMAR"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  },
                                  context: context);
                            },
                            icon: Icon(Icons.phone, size: 40),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                          IconButton(
                            onPressed: () async {
                              await showDialog(
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Horário de Funcionamento:"),
                                      content: Text(""),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("CONFIRMAR"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  },
                                  context: context);
                            },
                            icon: Icon(Icons.timer, size: 40),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      if (puxouFotos)
                        Container(
                          width: MediaQuery.of(context).size.width - 300,
                          height: MediaQuery.of(context).size.height - 150,
                          child: GridView(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5),
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('olá');
                                },
                                child: Image.asset('logo.jpg', scale: 0.9),
                              ),
                              Image.network(foto, scale: 0.9)
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }

          // children: <Widget>[
          // ],
          ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ImageCapture(empresaID)));
        },
      ),
    );
  }
}

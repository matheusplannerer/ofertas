import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/teste.dart';

class PerfilEmpresaPage extends StatefulWidget {
  String empresaID;

  PerfilEmpresaPage(this.empresaID);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PerfilEmpresaPageState(empresaID);
  }
}

class _PerfilEmpresaPageState extends State<PerfilEmpresaPage> {
  String empresaID;

  StorageReference ref = FirebaseStorage.instance.ref().child("cartaz2.jpg");

  String foto = '';

  bool puxouFotos = false;

  Future<String> getFoto() async {
    foto = await ref.getDownloadURL();
    setState(() {
      puxouFotos = true;
    });
  }

  _PerfilEmpresaPageState(this.empresaID) {
    getFoto();
  }

  @override
  Widget build(BuildContext context) {
    Image.network("");
    // TODO: implement build
    print(empresaID);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cartaz()));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance
                .collection('empresas')
                .document(empresaID)
                .get(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 25),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data.data['nomeEmpresa'],
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '300 Seguidores',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Unidade: 1',
                        style: TextStyle(fontSize: 18),
                      ),
                      // SizedBox(width: 80),
                      Image.asset('assets/wpp.jpg', scale: 0.9),
                      // SizedBox(width: 10),
                      Text(
                        'Contato',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        'Descrição curta',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 40),
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

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => CA002()));
                        },
                        icon: Icon(Icons.pin_drop, size: 40),
                      ),
                      SizedBox(width: 70),
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
                      SizedBox(width: 70),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.info_outline, size: 40),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
          SizedBox(height: 20),
          if (puxouFotos)
            Container(
              width: MediaQuery.of(context).size.width - 300,
              height: MediaQuery.of(context).size.height - 150,
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
                children: [
                  GestureDetector(
                    onTap: () {
                      print('olá');
                    },
                    child: Image.asset('assets/um.jpg', scale: 0.9),
                  ),
                  Image.network(foto, scale: 0.9)
                ],
              ),
            ),
        ],
      ),
    );
  }
}

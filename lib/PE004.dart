import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ofertas/CA002.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:provider/provider.dart';

class PE004 extends StatefulWidget {
  PE004({Key key}) : super(key: key);

  @override
  _PE004State createState() => _PE004State();
}

class _PE004State extends State<PE004> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  PerfilEmpresa perfil = PerfilEmpresa();

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text(
          'Pesquisar ofertas, empresas, categorias',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: ListView(
        children: [
          FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance
                .collection('empresas')
                .document(global.fbUser.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                perfil = PerfilEmpresa.fromJson(snapshot.data.data);
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 25),
                        Image.asset('assets/logo.jpg', scale: 0.9),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              perfil.nomeUnidade,
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
                                    content: Text(
                                        "${perfil.logradouro}, ${perfil.estado}"),
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
                                    content: Text("${perfil.whatsapp}"),
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
              }
            },
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width - 300,
            height: MediaQuery.of(context).size.height - 150,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
              children: [
                GestureDetector(
                  onTap: () {
                    print('olá');
                  },
                  child: Image.asset('assets/um.jpg', scale: 0.9),
                ),
                Image.asset('assets/dois.jpg', scale: 0.9),
                Image.asset('assets/tres.jpg', scale: 0.9),
                Image.asset('assets/tres.jpg', scale: 0.9),
                Image.asset('assets/dois.jpg', scale: 0.9),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer,
            ),
            title: Text(
              'Ofertas',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.image,
            ),
            title: Text(
              'Postar',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notification_important,
            ),
            title: Text(
              'Notificações',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Profile',
            ),
          ),
        ],
      ),
    );
  }
}

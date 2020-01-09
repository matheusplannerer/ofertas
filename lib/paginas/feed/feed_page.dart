import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/paginas/feed/oferta_detalhes.dart';
import 'package:ofertas/paginas/perfil/perfil_empresa.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FeedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FeedPageState();
  }
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5 - 100,
            child: FutureBuilder<QuerySnapshot>(
              initialData: null,
              future: Firestore.instance.collection('carrossel').getDocuments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<NetworkImage> images = [];
                  for (var i = 0; i < snapshot.data.documents.length; i++) {
                    images.add(NetworkImage(
                        snapshot.data.documents[i].data['imagem']));
                  }
                  return Carousel(
                    boxFit: BoxFit.fill,
                    autoplay: false,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 300),
                    dotSize: 8.0,
                    dotColor: Colors.grey,
                    dotIncreasedColor: Color(0xFFFF335C),
                    dotBgColor: Colors.transparent,
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 10.0,
                    showIndicator: true,
                    indicatorBgPadding: 7.0,
                    images: [...images],
                  );
                }
              },
            ),
          ),
          Container(height: 20, color: Colors.white),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Menu",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.8 - 50,
                  child: GridView.count(
                    childAspectRatio: 1.1,
                    crossAxisCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Column(
                        children: [
                          IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.ac_unit),
                            onPressed: () {},
                          ),
                          Text("ACADEMIA")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.add_to_photos),
                            onPressed: () {},
                          ),
                          Text("ACADEMIA")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.shop_two),
                            onPressed: () {},
                          ),
                          Text("ACADEMIA")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            color: Colors.orange,
                            icon: Icon(Icons.question_answer),
                            onPressed: () {},
                          ),
                          Text("ACADEMIA")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.format_align_justify),
                            onPressed: () {},
                          ),
                          Text("ACADEMIA")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.keyboard),
                            onPressed: () {},
                          ),
                          Text("ACADEMIA")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            color: Colors.purple,
                            icon: Icon(Icons.language),
                            onPressed: () {},
                          ),
                          Text("ACADEMIA")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            color: Colors.green,
                            icon: Icon(Icons.delete_sweep),
                            onPressed: () {},
                          ),
                          Text("ACADEMIA")
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Outros",
                        style: TextStyle(color: Colors.orange, fontSize: 17),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        onTap: () {},
                        trailing: Icon(Icons.arrow_forward),
                        title: Text(
                          "Ofertas da Semana",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('ofertas')
                        .getDocuments()
                        .asStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> pages = [];

                        print((snapshot.data.documents.length == 1
                            ? 1
                            : snapshot.data.documents.length ~/ 2 +
                                snapshot.data.documents.length % 2));

                        for (var i = 0;
                            i <
                                (snapshot.data.documents.length == 1
                                    ? 1
                                    : snapshot.data.documents.length ~/ 2 +
                                        snapshot.data.documents.length % 2);
                            i = i + 2) {
                          Widget item1 = FutureBuilder<DocumentSnapshot>(
                            future: Firestore.instance
                                .collection('empresas')
                                .document(
                                  snapshot
                                      .data.documents[i].data['empresaDona'],
                                )
                                .get(),
                            builder: (context, snapshotEmpresaUm) {
                              if (snapshot.hasData &&
                                  snapshotEmpresaUm.hasData) {
                                return GestureDetector(
                                  onTap: () {
                                    OfertaModel produto = OfertaModel.fromJson(
                                        snapshot.data.documents[i].data,
                                        snapshot.data.documents[i].documentID);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => OfertaDetalhe(
                                          empresaID:
                                              snapshotEmpresaUm.data.documentID,
                                          produto: produto,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              snapshot.data.documents[i]
                                                  .data['imagem'],
                                            ),
                                          ),
                                        ),
                                        width: 150,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PerfilEmpresaPage(
                                                          snapshotEmpresaUm.data
                                                              .documentID)));
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: snapshotEmpresaUm
                                                          .data.data['foto'] !=
                                                      null
                                                  ? NetworkImage(
                                                      snapshotEmpresaUm
                                                          .data.data['foto'],
                                                    )
                                                  : AssetImage(
                                                      "assets/mogi.jpg"),
                                              maxRadius: 20,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              snapshotEmpresaUm
                                                  .data.data['nomeEmpresa'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationStyle:
                                                    TextDecorationStyle.solid,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          );
                          Widget espaco = SizedBox(width: 15);
                          Widget item2 = Container();
                          if (snapshot.data.documents.length > i + 1)
                            item2 = FutureBuilder<DocumentSnapshot>(
                              future: Firestore.instance
                                  .collection('empresas')
                                  .document(
                                    snapshot.data.documents[i + 1]
                                        .data['empresaDona'],
                                  )
                                  .get(),
                              builder: (context, snapshotEmpresaDois) {
                                if (snapshot.hasData &&
                                    snapshotEmpresaDois.hasData) {
                                  return GestureDetector(
                                    onTap: () {
                                      print("Oferta");
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                snapshot.data.documents[i]
                                                    .data['imagem'],
                                              ),
                                            ),
                                          ),
                                          width: 150,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage:
                                                  snapshotEmpresaDois.data
                                                              .data['foto'] !=
                                                          null
                                                      ? NetworkImage(
                                                          snapshotEmpresaDois
                                                              .data
                                                              .data['foto'],
                                                        )
                                                      : AssetImage(
                                                          "assets/mogi.jpg"),
                                              maxRadius: 20,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              snapshotEmpresaDois
                                                  .data.data['nomeEmpresa'],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            );

                          Widget page = Row(
                            children: <Widget>[
                              item1,
                              espaco,
                              item2,
                            ],
                          );
                          pages.add(page);
                        }

                        return PageView.builder(
                          itemCount: pages.length,
                          itemBuilder: (context, index) {
                            return pages[index];
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        onTap: () {},
                        trailing: Icon(Icons.arrow_forward),
                        title: Text(
                          "Conheça os Estabelecimentos",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                // GestureDetector(
                //   onTap: () {
                //     print("Entrou no estabelecimento");
                //   },
                //   child: Container(
                //     height: 80,
                //     width: MediaQuery.of(context).size.width,
                //     // color: Colors.green,
                //     child: Row(
                //       children: <Widget>[
                //         Expanded(
                //           flex: 2,
                //           child: Center(
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 border: Border.all(),
                //                 color: Colors.green,
                //                 image: DecorationImage(
                //                     image: AssetImage("assets/logo.jpg"),
                //                     fit: BoxFit.fill),
                //               ),
                //             ),
                //           ),
                //         ),
                //         Expanded(
                //           flex: 3,
                //           child: Container(
                //             decoration: BoxDecoration(
                //               border: Border.all(),
                //             ),
                //             child: Column(
                //               children: <Widget>[
                //                 Text(
                //                   "WALMART",
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontSize: 18,
                //                       fontWeight: FontWeight.bold),
                //                   textAlign: TextAlign.center,
                //                 ),
                //                 SizedBox(height: 10),
                //                 SmoothStarRating(
                //                   rating: 4,
                //                 ),
                //                 Text("4.0 (300+)")
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10),
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('empresas')
                      .getDocuments()
                      .asStream(),
                  builder: (context, empresas) {
                    if (empresas.hasData) {
                      List<Widget> lista = [];
                      for (var i = 0; i < empresas.data.documents.length; i++) {
                        PerfilEmpresa empresa = PerfilEmpresa.fromJson(
                          empresas.data.documents[i].data,
                          empresas.data.documents[i].documentID,
                        );

                        lista.add(
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      PerfilEmpresaPage(empresa.idEmpresa)));
                            },
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.green,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          color: Colors.green,
                                          image: DecorationImage(
                                              image: empresa.foto != null
                                                  ? NetworkImage(empresa.foto)
                                                  : AssetImage(
                                                      "assets/mogi.jpg"),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            empresa.nomeEmpresa,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 10),
                                          SmoothStarRating(
                                            rating: 4,
                                          ),
                                          Text("4.0 (300+)")
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        lista.add(SizedBox(height: 10));
                      } //Fim do FOR

                      return Column(
                        children: <Widget>[...lista],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

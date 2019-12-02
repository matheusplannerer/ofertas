import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:ofertas/crop.dart';
import 'package:ofertas/feed_item.dart';
import 'package:ofertas/models/classes_usuarios.dart';
import 'package:ofertas/models/produtos.dart';
import 'package:ofertas/perfil_usuario.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/login.dart';
import 'package:ofertas/teste.dart';
import './ProductPage.dart';
import 'package:ofertas/shared/colors.dart';
import 'package:ofertas/shared/partials.dart';
import 'package:ofertas/shared/Product.dart';
import 'package:ofertas/shared/styles.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import './shared/colors.dart';
import './shared/styles.dart';

const Color bgColor = Color(0xffF4F7FA);
//  const Color primaryColor = Colors.green;
const Color primaryColor = Color(0xFFF57C00);
const Color white = Colors.white;
const Color darkText = Colors.black54;
const Color highlightColor = Colors.orange;

class Dashboard extends StatefulWidget {
  // final String pageTitle;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  FirebaseUser fbUser;

  @override
  Widget build(BuildContext context) {
    var global = Provider.of<Global>(context);

    final _tabs = [
      storeTab(context),
      Text('Tab2'),
      PerfilUsuario(),
      Text('Tab4'),
      Text('Tab5'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title:
            Text('OFERTAS', style: logoWhiteStyle, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Icons.search),
          ),
          // if(fbUser !== null){

          // },
          // else {
          //         setState(() {
          //           errorMsg = true;
          //         });
          // IconButton(padding: EdgeInsets.all(0),
          // onPressed: (){},
          // iconSize: 21,
          // icon:Icon(Icons.system_update_alt))
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.orange[200],
          child: ListView(
            children: <Widget>[
              // ListTile(
              //   title: Text('Configurações'),
              //   trailing: Icon(Icons.arrow_forward),
              // ),
              if (global.fbUser == null)
                ListTile(
                  title: Text('LOGAR'),
                  trailing: Icon(Icons.person),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ListTile(
                title: Text('AVALIAR APLICATIVO'),
                trailing: Icon(Icons.star_border),
                // onTap: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => CA001()));
                // },
              ),
              ListTile(
                trailing: Icon(Icons.report_problem),
                title: Text("ENTRE EM CONTATO"),
                // onTap: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => CA001()));
                // },
              ),
              if (global.fbUser != null)
                ListTile(
                  trailing: Icon(Icons.report_problem),
                  title: Text('SAIR'),
                  onTap: () async {
                    Navigator.of(context).pop();
                    showLoadingDialog();
                    await Future.delayed(Duration(milliseconds: 400));
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
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: global.fbUser != null
          ? BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text(
                    'OFERTAS',
                    style: tabLinkStyle,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_a_photo),
                  title: Text(
                    '',
                    style: tabLinkStyle,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text(
                    'PERFIL',
                    style: tabLinkStyle,
                  ),
                ),
              ],
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.orange,
              onTap: _onItemTapped,
            )
          : null,
    );
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => ImageCapture()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}

Widget storeTab(BuildContext context) {
  List<Product> foods = [
    Product(
        name: "Hamburger",
        image: "assets/tres.jpg",
        price: "\$25.00",
        userLiked: true,
        discount: 10),
    Product(
        name: "Pizza",
        image: "assets/tres.jpg",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Sei lá",
      image: 'assets/tres.jpg',
      price: '\$10.99',
      userLiked: false,
    ),
    Product(
        name: "ihu",
        image: "assets/tres.jpg",
        price: '\$50.00',
        userLiked: true,
        discount: 14)
  ];

  List<Product> drinks = [
    Product(
        name: "Coca-Cola",
        image: "assets/tres.jpg",
        price: "\$45.12",
        userLiked: true,
        discount: 2),
    Product(
        name: "Limão",
        image: "assets/tres.jpg",
        price: "\$28.00",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Vodka",
        image: "assets/tres.jpg",
        price: "\$78.99",
        userLiked: false),
    Product(
        name: "Tequila",
        image: "assets/tres.jpg",
        price: "\$168.99",
        userLiked: true,
        discount: 3.4)
  ];

  return StreamBuilder<QuerySnapshot>(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        // List<Dados> produtos = [];
        // for (var i = 0; i < snapshot.data.documents.length; i++) {
        //   Dados aux = Dados.fromJson(snapshot.data.documents[i].data);
        // }

        return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context, index) {
            return FutureBuilder<QuerySnapshot>(
              builder: (context, snapshotdois) {
                if (snapshotdois.hasData) {
                  List<FeedItem> items = [];
                  for (var i = 0; i < snapshotdois.data.documents.length; i++) {
                    Dados aux =
                        Dados.fromJson(snapshotdois.data.documents[i].data);

                    items.add(FeedItem(aux));
                  }
                  // print(snapshot.data.documents[index].data['nomeEmpresa'] +
                  //     " " +
                  //     snapshotdois.data.documents.length.toString());
                  // return deals(
                  //   snapshot.data.documents[index].data['nomeEmpresa'],
                  // );
                  PerfilEmpresa empresa = PerfilEmpresa.fromJson(
                      snapshot.data.documents[index].data);
                  return deals(empresa, items: items);
                } else
                  return Text("");
              },
              future: Firestore.instance
                  .collection('empresas')
                  .document(snapshot.data.documents[index].documentID)
                  .collection('ofertas')
                  .getDocuments(),
            );
            // deals(
            //   snapshot.data.documents[index].data['nomeEmpresa'],
            //   items: [FeedItem(produto: ),],
            // );
          },
          itemCount: snapshot.data.documents.length,
        );
      } else
        return Text("");
    },
    stream: Firestore.instance.collection('empresas').getDocuments().asStream(),
  );

  // return ListView(
  //   children: <Widget>[
  //     deals('Carrefour', onViewMore: () {}, items: <Widget>[
  //       foodItem(
  //         foods[0],
  //         onTapped: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) {
  //                 return new ProductPage(
  //                   productData: foods[0],
  //                 );
  //               },
  //             ),
  //           );
  //         },
  //         onLike: () {},
  //       ),
  //       foodItem(
  //         foods[1],
  //         onTapped: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) {
  //                 return new ProductPage(
  //                   productData: foods[1],
  //                 );
  //               },
  //             ),
  //           );
  //         },
  //         imgWidth: 250,
  //         onLike: () {},
  //       ),
  //       foodItem(
  //         foods[2],
  //         onTapped: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) {
  //                 return new ProductPage(
  //                   productData: foods[2],
  //                 );
  //               },
  //             ),
  //           );
  //         },
  //         imgWidth: 200,
  //         onLike: () {},
  //       ),
  //       foodItem(foods[3], onTapped: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) {
  //               return new ProductPage(
  //                 productData: foods[3],
  //               );
  //             },
  //           ),
  //         );
  //       }, onLike: () {}),
  //     ]),
  //     deals(
  //       'Confiança',
  //       onViewMore: () {},
  //       items: <Widget>[
  //         foodItem(
  //           drinks[0],
  //           onTapped: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) {
  //                   return new ProductPage(
  //                     productData: drinks[0],
  //                   );
  //                 },
  //               ),
  //             );
  //           },
  //           onLike: () {},
  //           imgWidth: 60,
  //         ),
  //         foodItem(
  //           drinks[1],
  //           onTapped: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) {
  //                   return new ProductPage(
  //                     productData: drinks[1],
  //                   );
  //                 },
  //               ),
  //             );
  //           },
  //           onLike: () {},
  //           imgWidth: 75,
  //         ),
  //         foodItem(
  //           drinks[2],
  //           onTapped: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) {
  //                   return new ProductPage(
  //                     productData: drinks[2],
  //                   );
  //                 },
  //               ),
  //             );
  //           },
  //           imgWidth: 110,
  //           onLike: () {},
  //         ),
  //         foodItem(
  //           drinks[3],
  //           onTapped: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) {
  //                   return new ProductPage(
  //                     productData: drinks[3],
  //                   );
  //                 },
  //               ),
  //             );
  //           },
  //           onLike: () {},
  //         ),
  //       ],
  //     )
  //   ],
  // );
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return ListTile(
    leading: Text(
      headerTitle,
      style: h4,
    ),
    trailing: IconButton(
      onPressed: onViewMore,
      icon: Icon(
        Icons.arrow_forward_ios,
        color: contrastText.color,
      ),
    ),
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(PerfilEmpresa empresa, {onViewMore, List<FeedItem> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
          leading: Text(
            empresa.nomeEmpresa,
            style: h4,
          ),
          trailing: IconButton(
            onPressed: onViewMore,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: contrastText.color,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}

// Widget _Botao StatefulWidgetBuilder(context, setState)

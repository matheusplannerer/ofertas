import 'package:flutter/material.dart';
import 'package:ofertas/login.dart';
import './ProductPage.dart';
import 'package:ofertas/shared/colors.dart';
import 'package:ofertas/shared/partials.dart';
import 'package:ofertas/shared/Product.dart';
import 'package:ofertas/shared/styles.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';




class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
    FirebaseUser fbUser;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      Text('Tab2'),
      Text('Tab3'),
      Text('Tab4'),
      Text('Tab5'),
    ];

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('OFERTAS',
              style: logoWhiteStyle, textAlign: TextAlign.center),
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
          child: ListView(
            children: <Widget>[
              // ListTile(
              //   title: Text('Configurações'),
              //   trailing: Icon(Icons.arrow_forward),
              // ),
              ListTile(
                title: Text('Acesso a conta'),
                trailing: Icon(Icons.person),
                onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              ListTile(
                title: Text('Avaliar app'),
                trailing: Icon(Icons.star_border),
                // onTap: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => CA001()));
                // },
              ),
              ListTile(
                trailing: Icon(Icons.report_problem),
                title: Text('Problemas ou dificuldades'),
                // onTap: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => CA001()));
                // },
              ),
            ],
          ),
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Ofertas',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text(
                  'Favoritos',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  'Não sabemos',
                  style: tabLinkStyle,
                )),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.orange,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget storeTab(BuildContext context) {
  List<Product> foods = [
    Product(
        name: "Hamburger",
        image: "images/3.png",
        price: "\$25.00",
        userLiked: true,
        discount: 10),
    Product(
        name: "Pizza",
        image: "images/5.png",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Sei lá",
      image: 'images/2.png',
      price: '\$10.99',
      userLiked: false,
    ),
    Product(
        name: "ihu",
        image: "images/1.png",
        price: '\$50.00',
        userLiked: true,
        discount: 14)
  ];

  List<Product> drinks = [
    Product(
        name: "Coca-Cola",
        image: "images/6.png",
        price: "\$45.12",
        userLiked: true,
        discount: 2),
    Product(
        name: "Limão",
        image: "images/7.png",
        price: "\$28.00",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Vodka",
        image: "images/8.png",
        price: "\$78.99",
        userLiked: false),
    Product(
        name: "Tequila",
        image: "images/9.png",
        price: "\$168.99",
        userLiked: true,
        discount: 3.4)
  ];

  return ListView(children: <Widget>[
    deals('Carrefour', onViewMore: () {}, items: <Widget>[
      foodItem(foods[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[0],
              );
            },
          ),
        );
      }, onLike: () {}),
      foodItem(foods[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[1],
              );
            },
          ),
        );
      }, imgWidth: 250, onLike: () {}),
      foodItem(foods[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[2],
              );
            },
          ),
        );
      }, imgWidth: 200, onLike: () {}),
      foodItem(foods[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[3],
              );
            },
          ),
        );
      }, onLike: () {}),
    ]),
    deals('Confiança', onViewMore: () {}, items: <Widget>[
      foodItem(drinks[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[0],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 60),
      foodItem(drinks[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[1],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 75),
      foodItem(drinks[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[2],
              );
            },
          ),
        );
      }, imgWidth: 110, onLike: () {}),
      foodItem(drinks[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[3],
              );
            },
          ),
        );
      }, onLike: () {}),
    ])
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return ListTile(
    leading: Text(headerTitle, style: h4,),
    trailing: IconButton(
      onPressed: onViewMore,
      icon: Icon(Icons.arrow_forward_ios, color: contrastText.color,),
    )
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

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
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
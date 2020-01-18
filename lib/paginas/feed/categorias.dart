import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/paginas/login/login.dart';

class CategoriasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text(
          "CATEGORIAS",
          style: TextStyle(color: Colors.white),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        children: <Widget>[
          _widgetCategorias(context, "PET SHOP", "https://images.pexels.com/photos/1254140/pexels-photo-1254140.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          _widgetCategorias(context, "MERCADOS", "https://images.pexels.com/photos/264636/pexels-photo-264636.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          _widgetCategorias(context, 'LIVRARIAS', "https://images.pexels.com/photos/1370295/pexels-photo-1370295.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          _widgetCategorias(context, "MODA", "https://images.pexels.com/photos/994517/pexels-photo-994517.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          _widgetCategorias(context, "BELEZA E CUIDADO PESSOAL", "https://images.pexels.com/photos/3188/love-romantic-bath-candlelight.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          _widgetCategorias(context, 'BRINQUEDOS', "https://images.pexels.com/photos/194094/pexels-photo-194094.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _widgetCategorias(context, 'ESPORTES E LAZER', "https://images.pexels.com/photos/248547/pexels-photo-248547.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          _widgetCategorias(context, 'TECNOLOGIA', "https://images.pexels.com/photos/373543/pexels-photo-373543.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940")         

        ],
      ),
    );
  }
}

Widget _widgetCategorias(context, categoria, foto) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    },
    child: Container(
      width: MediaQuery.of(context).size.width / 3 - 40,
      height: MediaQuery.of(context).size.width / 3 - 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(foto),
        )
      ),
      child: Center(
        child: Text(
          categoria,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(

            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
  );
}
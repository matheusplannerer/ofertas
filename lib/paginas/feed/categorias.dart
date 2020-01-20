import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/paginas/login/login.dart';

class CategoriasPage extends StatelessWidget {
  Map<String, String> categorias = {
    "Agro, Comércio e Indústria":
        "https://images.pexels.com/photos/1615784/pexels-photo-1615784.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Alimentos e Bebidas":
        "https://images.pexels.com/photos/890515/pexels-photo-890515.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Animais":
        "https://images.pexels.com/photos/1254140/pexels-photo-1254140.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Antiguidades":
        "https://images.pexels.com/photos/448835/pexels-photo-448835.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Arte e Artesanato":
        "https://images.pexels.com/photos/3585856/pexels-photo-3585856.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Artigos Religiosos":
        "https://images.pexels.com/photos/3026839/pexels-photo-3026839.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Bebes":
        "https://images.pexels.com/photos/101537/baby-boy-hat-covered-101537.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Brinquedos":
        "https://images.pexels.com/photos/194094/pexels-photo-194094.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "Calçados, Roupas e Bolsas":
        "https://images.pexels.com/photos/1036856/pexels-photo-1036856.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Câmeras e Acessorios":
        "https://images.pexels.com/photos/2273262/pexels-photo-2273262.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Casa, Móveis e Decoração":
        "https://images.pexels.com/photos/3275581/pexels-photo-3275581.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Celular e Telefone":
        "https://images.pexels.com/photos/1156684/pexels-photo-1156684.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Coleções e Comics":
        "https://images.pexels.com/photos/16516/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Construção":
        "https://images.pexels.com/photos/3323694/pexels-photo-3323694.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Diversos e Outros":
        "https://images.pexels.com/photos/1393382/pexels-photo-1393382.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Educação":
        "https://images.pexels.com/photos/6565/apple-desk-laptop-working.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Eletrônicos":
        "https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Eletrodomésticos":
        "https://images.pexels.com/photos/2482119/pexels-photo-2482119.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Esportes":
        "https://images.pexels.com/photos/371049/pexels-photo-371049.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Festas e Eventos":
        "https://images.pexels.com/photos/2526105/pexels-photo-2526105.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Filme e seriados":
        "https://images.pexels.com/photos/2398356/pexels-photo-2398356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Gráficas e Impressão":
        "https://images.pexels.com/photos/924824/pexels-photo-924824.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Games e Jogos":
        "https://images.pexels.com/photos/1293260/pexels-photo-1293260.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Informática":
        "https://images.pexels.com/photos/1089440/pexels-photo-1089440.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Imóveis":
        "https://images.pexels.com/photos/1795507/pexels-photo-1795507.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Jóias e Relógios":
        "https://images.pexels.com/photos/2732096/pexels-photo-2732096.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Limpeza":
        "https://images.pexels.com/photos/48889/cleaning-washing-cleanup-the-ilo-48889.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Livros":
        "https://images.pexels.com/photos/694740/pexels-photo-694740.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Marketing e Internet":
        "https://images.pexels.com/photos/241544/pexels-photo-241544.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Motoristas Particulares":
        "https://images.pexels.com/photos/2705755/pexels-photo-2705755.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Música":
        "https://images.pexels.com/photos/2796145/pexels-photo-2796145.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Saúde e Beleza":
        "https://images.pexels.com/photos/264591/pexels-photo-264591.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Uso Pessoal":
        "https://images.pexels.com/photos/1697220/pexels-photo-1697220.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Utensílios Domésticos":
        "https://images.pexels.com/photos/3298694/pexels-photo-3298694.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Veículos":
        "https://images.pexels.com/photos/70912/pexels-photo-70912.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Viagens e Turismo":
        "https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  };

  ScrollController _scrollController = ScrollController();

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

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: categorias.length,
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, i) {
            return _widgetCategorias(context, categorias.keys.toList()[i],
                categorias.values.toList()[i]);
          },
        ),
      ),
      // body: GridView(
      //   padding: EdgeInsets.all(10.0),
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 10.0,
      //     mainAxisSpacing: 10.0,
      //   ),
      //   children: <Widget>[

      //   ],
      // ),
    );
  }
}

Widget _widgetCategorias(context, categoria, foto) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    },
    child: Container(
      width: MediaQuery.of(context).size.width / 3 - 40,
      height: MediaQuery.of(context).size.width / 3 - 40,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(foto),
      )),
      child: Center(
        child: Text(
          categoria,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
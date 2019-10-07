import 'package:ofertas/CA002.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 25),
          Row(
            children: [
              SizedBox(width: 25),
              Image.asset('assets/logo.jpg', scale: 0.9),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome da Empresa',
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Categoria',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    '300 Seguidores',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Unidade: Todas',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 80),
              Image.asset('assets/wpp.jpg', scale: 0.9),
              SizedBox(width: 10),
              Text(
                'Whatsapp',
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CA002()));
                },
                icon: Icon(Icons.pin_drop, size: 40),
              ),
              SizedBox(width: 70),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.phone, size: 40),
              ),
              SizedBox(width: 70),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.info_outline, size: 40),
              ),
            ],
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ofertas/login.dart';
import 'package:ofertas/CA0010.dart';
import 'package:load/load.dart';
import 'package:ofertas/CA006.dart';
import 'package:ofertas/global/global.dart';
import 'package:ofertas/teste.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<Global>(
        builder: (context) => Global(),
        child: LoadingProvider(
          child: MyApp(),
        ),
      ),
    );

  

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.grey[500]),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          minWidth: 325.0,
          height: 50.0,
          buttonColor: Colors.blueGrey[300]
        ),
      ),
      home: LoginPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => CA001()));
//       }), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

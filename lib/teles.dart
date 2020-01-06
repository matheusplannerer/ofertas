// import 'package:flutter/material.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';
// import 'package:ofertas/feed_item.dart';
// import 'package:flutter_launch/flutter_launch.dart';

// class Teles extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _Teles();
//   }
// }

// class _Teles extends State<Teles> {
//   initState() {
//     super.initState();
//   }

//   void whatsAppOpen() async {
//     await FlutterLaunch.launchWathsApp(
//         phone: "5515996843569", message: "Hello");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: GradientAppBar(
//         gradient:
//             LinearGradient(colors: [Colors.orange[900], Colors.orange[300]]),
//         title: Text(
//           'TESTE',
//           style: TextStyle(color: white),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: FlatButton(
//           child: Text("Open WhatsApp"),
//           onPressed: () {
//             whatsAppOpen();
//           },
//         ),
//       ),
//     );
//   }
// }

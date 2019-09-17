import 'package:flutter/material.dart';
import 'package:ofertas/PE0004.dart';
import 'package:ofertas/CA004.dart';

class CA002 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Cadastro com Facebook',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 90),
            Image.asset('assets/logo2.jpg', scale: 1.4),
            SizedBox(height: 40),
            Text(
              'Continue as Name',
              style: TextStyle(fontSize: 25, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            Text(
              'LoginApp will receive',
              style: TextStyle(fontSize: 20, color: Colors.grey[400]),
            ),
            Text(
              'your public profile.',
              style: TextStyle(fontSize: 20, color: Colors.grey[400]),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.border_color, color: Colors.grey[600]),
                ),
                Text(
                  'Learn More',
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 110),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              minWidth: 250.0,
              height: 50.0,
              child: RaisedButton(
                color: Colors.blueGrey[700],
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CA004()));
                },
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, color: Colors.grey[600]),
                Text(
                  "  This doesn't let the app post to Facebook",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
      );
  }
}
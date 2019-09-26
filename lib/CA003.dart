import 'package:flutter/material.dart';
import 'package:ofertas/CA001.dart';
import 'package:ofertas/CA004.dart';

class CA003 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CA001()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Cadastre com Goolge',
          style: TextStyle(fontSize: 19, color: Colors.white),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 60),
            Text(
              'Google',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, color: Colors.grey[400]),
            ),
            SizedBox(height: 10),
            Text(
              'Sign in with your Goolge Account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey[400]),
            ),
            SizedBox(height: 30),
            Center(
              child: Card(
                color: Colors.grey[50],
                elevation: 1,
                margin: EdgeInsets.only(right: 35.0, left: 35.0),
                child: Column(
                  children: [
                    Icon(Icons.person_pin,
                        color: Colors.blueGrey[200], size: 90),
                    Container(
                      margin: EdgeInsets.only(right: 25.0, left: 25.0, top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 25.0, left: 25.0, top: 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 20.0, bottom: 15.0),
                      child: Center(
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          minWidth: 290.0,
                          height: 40.0,
                          child: RaisedButton(
                            color: Colors.blueGrey[300],
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CA004()));
                            },
                            child: Text(
                              'Sing in',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 25, bottom: 30),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Need help?',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
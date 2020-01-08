import 'package:flutter/material.dart';
import 'package:ofertas/main.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EntreEmContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: GradientAppBar(
        title: Text(
          "FALE CONOSCO",
          style: TextStyle(
              fontFamily: "Poppins-Bold",
              color: Colors.white,
              letterSpacing: .6),
        ),
        centerTitle: true,
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Entre em contato via nosso e-mail:',
                  style:
                      TextStyle(color: Colors.black, height: 1, fontSize: 20)),
                  
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.email),
                  Text('ofertasmogimirim@gmail.com',
                  style:
                      TextStyle(color: Colors.black, height: 1, fontSize: 20)),
                ],
              )
            ],
          ),
    );
  }
}

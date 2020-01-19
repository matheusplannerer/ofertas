import 'package:flutter/material.dart';
import 'perfil_empresa.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';


class Horarios extends StatefulWidget
{ 
  
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<Horarios> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        // elevation: 0,
        // backgroundColor: primaryColor,
        title:
            Text('OFERTAS', 
              style: TextStyle(
              fontSize: 22,
              fontFamily: "Poppins-Bold",
              color: Colors.white,
              letterSpacing: .6),),
              gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
      ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        child:  Column(
          children: <Widget>[
            SizedBox(height: 15,),
            Text('HORÁRIOS', style: TextStyle(color: Colors.black,
            fontSize: 15),),
         

          ],
        ),
      )
      
    );
  }
}
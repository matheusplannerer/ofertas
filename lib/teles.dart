import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Teles extends StatefulWidget {
  TelesState createState() => TelesState();
}

bool x = true;
bool y = false;
bool z = true;

class TelesState extends State<Teles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient:
            LinearGradient(colors: [Colors.orange[900], Colors.orange[300]]),
        title: Text('TESTE', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          // width: 600,
          height: 600,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 30,
                height: 100,
              ),
              Card(
                elevation: 3,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
                  width: 300,
                  height: 600,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Mensal',
                        style: TextStyle(
                          fontFamily: 'Title',
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Básico',
                            style: TextStyle(
                              fontFamily: 'SubTitle',
                              fontSize: 25,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        '(Disponível apenas no plano anual)',
                        style: TextStyle(
                          fontFamily: 'Body',
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          // color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Text(
                            'R\$ ',
                            style: TextStyle(
                              fontFamily: 'Body',
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '00,00',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            onChanged: (bool resp) {
                              setState(() {
                                z = true;
                                x = false;
                              });
                            },
                            value: z,
                          ),
                          Text(
                            'Pro',
                            style: TextStyle(
                              fontFamily: 'SubTitle',
                              fontSize: 25,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'Perfil Empresarial',
                        style: TextStyle(
                          fontFamily: 'Body',
                          fontSize: 15,
                          // color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Publicação ilimitada de ofertas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Body',
                          fontSize: 15,
                          // color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Text(
                            'R\$ ',
                            style: TextStyle(
                              fontFamily: 'Body',
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '3000,00',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFF8A65),
                              Color(0xFFFF5722),
                              Color(0xFFD84315)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0)
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: FlatButton(
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                "Comprar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 30),
              Card(
                elevation: 3,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
                  width: 300,
                  height: 600,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Anual',
                        style: TextStyle(
                          fontFamily: 'Title',
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            onChanged: (bool resp) {
                              setState(() {
                                x = resp;
                                y = false;
                              });
                            },
                            value: x,
                          ),
                          Text(
                            'Básico',
                            style: TextStyle(
                              fontFamily: 'SubTitle',
                              fontSize: 25,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'Perfil Empresarial',
                        style: TextStyle(
                          fontFamily: 'Body',
                          fontSize: 15,
                          // color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Text(
                            'R\$ ',
                            style: TextStyle(
                              fontFamily: 'Body',
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '200,00',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            onChanged: (bool resp) {
                              setState(() {
                                y = resp;
                                x = false;
                              });
                            },
                            value: y,
                          ),
                          Text(
                            'Pro',
                            style: TextStyle(
                              fontFamily: 'SubTitle',
                              fontSize: 25,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'Perfil Empresarial',
                        style: TextStyle(
                          fontFamily: 'Body',
                          fontSize: 15,
                          // color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Publicação ilimitada de ofertas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Body',
                          fontSize: 15,
                          // color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Text(
                            'R\$ ',
                            style: TextStyle(
                              fontFamily: 'Body',
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '3000,00',
                            style: TextStyle(
                              fontFamily: 'Body',
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFF8A65),
                              Color(0xFFFF5722),
                              Color(0xFFD84315)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0)
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: FlatButton(
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                "Comprar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 30,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
//                     color: Colors.blue,
//                     width: 300,
//                     height: 320,
//                     child: Card(
//                       elevation: 3,
//                       child: Container(
//                         child: Column(
//                           children: <Widget>[
//                             Container(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Checkbox(
//                                     onChanged: (bool resp) {
//                                       setState(() {
//                                         x = resp;
//                                         y = false;
//                                       });
//                                     },
//                                     value: x,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.only(
//                                   left: 20, right: 20, bottom: 5),
//                               child: Column(
//                                 children: <Widget>[
//                                   Text(
//                                     'Anual',
//                                     style: TextStyle(
//                                       fontFamily: 'Title',
//                                       fontSize: 35,
//                                     ),
//                                   ),
//                                   SizedBox(height: 30),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//                                       Text(
//                                         'Pro',
//                                         style: TextStyle(
//                                           fontFamily: 'SubTitle',
//                                           fontSize: 25,
//                                           color: Colors.grey[800],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Divider(),
//                                   SizedBox(height: 10),
//                                   Text(
//                                     'Perfil Empresarial',
//                                     style: TextStyle(
//                                       fontFamily: 'Body',
//                                       fontSize: 15,
//                                       // color: Colors.grey[800],
//                                     ),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Text(
//                                     'Publicação ilimitada de ofertas',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontFamily: 'Body',
//                                       fontSize: 15,
//                                       // color: Colors.grey[800],
//                                     ),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Wrap(
//                                     crossAxisAlignment:
//                                         WrapCrossAlignment.center,
//                                     children: <Widget>[
//                                       Text(
//                                         'R\$ ',
//                                         style: TextStyle(
//                                           fontFamily: 'Body',
//                                           color: Colors.grey,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                       Text(
//                                         '3000,00',
//                                         style: TextStyle(
//                                           fontFamily: 'Body',
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 35,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
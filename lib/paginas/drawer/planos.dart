import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Planos extends StatefulWidget {
  PlanosState createState() => PlanosState();
}

bool anual_pro = false;
bool mensal_pro = false;
bool anual_basico = false;

class PlanosState extends State<Planos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient:
            LinearGradient(colors: [Colors.orange[900], Colors.orange[300]]),
        title: Text(
          "ASSINE JÁ",
          style: TextStyle(
              fontSize: 23,
              fontFamily: "Poppins-Bold",
              color: Colors.white,
              letterSpacing: .6),
        ),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 30, left: 30, top: 40),
            child: Column(
              children: <Widget>[
                Text(
                  'Planos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SubTitle',
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Escolha abaixo o plano que mais combina com você',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SubTitle',
                    fontSize: 20,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            height: 320,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          color: Colors.grey,
                          width: 30,
                        ),
                        Container(
                          width: 300,
                          height: 320,
                          child: Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 5),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Anual',
                                    style: TextStyle(
                                      fontFamily: 'Title',
                                      fontSize: 35,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(width: 25),
                                      Text(
                                        'Pro',
                                        style: TextStyle(
                                          fontFamily: 'SubTitle',
                                          fontSize: 25,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      Checkbox(
                                        onChanged: (bool x) {
                                          setState(() {
                                            anual_pro = x;
                                            mensal_pro = false;
                                            anual_basico = false;
                                          });
                                        },
                                        value: anual_pro,
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Perfil Empresarial',
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          fontSize: 15,
                                          // color: Colors.grey[800],
                                        ),
                                      ),
                                      Icon(Icons.check, color: Colors.green),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Publicação ilimitada de ofertas',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          fontSize: 15,
                                          // color: Colors.grey[800],
                                        ),
                                      ),
                                      Icon(Icons.check, color: Colors.green),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
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
                                      Text(
                                        ' / ano ',
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          width: 300,
                          height: 320,
                          child: Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 5),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Mensal',
                                    style: TextStyle(
                                      fontFamily: 'Title',
                                      fontSize: 35,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(width: 25),
                                      Text(
                                        'Pro',
                                        style: TextStyle(
                                          fontFamily: 'SubTitle',
                                          fontSize: 25,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      Checkbox(
                                        onChanged: (bool y) {
                                          setState(() {
                                            mensal_pro = y;
                                            anual_pro = false;
                                            anual_basico = false;
                                          });
                                        },
                                        value: mensal_pro,
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Perfil Empresarial',
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          fontSize: 15,
                                          // color: Colors.grey[800],
                                        ),
                                      ),
                                      Icon(Icons.check, color: Colors.green),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Publicação ilimitada de ofertas',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          fontSize: 15,
                                          // color: Colors.grey[800],
                                        ),
                                      ),
                                      Icon(Icons.check, color: Colors.green),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
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
                                        '300,00',
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 35,
                                        ),
                                      ),
                                      Text(
                                        ' / mês ',
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          width: 300,
                          height: 320,
                          child: Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 5),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Anual',
                                    style: TextStyle(
                                      fontFamily: 'Title',
                                      fontSize: 35,
                                    ),
                                  ),
                                  SizedBox(height: 22),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(width: 20),
                                      Text(
                                        'Básico',
                                        style: TextStyle(
                                          fontFamily: 'SubTitle',
                                          fontSize: 25,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      Checkbox(
                                        onChanged: (bool z) {
                                          setState(() {
                                            anual_basico = z;
                                            anual_pro = false;
                                            mensal_pro = false;
                                          });
                                        },
                                        value: anual_basico,
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Perfil Empresarial',
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          fontSize: 15,
                                          // color: Colors.grey[800],
                                        ),
                                      ),
                                      Icon(Icons.check, color: Colors.green),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Publicação ilimitada de ofertas',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          fontSize: 15,
                                          // color: Colors.grey[800],
                                        ),
                                      ),
                                      Icon(Icons.clear, color: Colors.red),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
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
                                      Text(
                                        ' / ano ',
                                        style: TextStyle(
                                          fontFamily: 'Body',
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          width: 290,
                          height: 320,
                          child: Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 5),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Mensal',
                                    style: TextStyle(
                                      fontFamily: 'Title',
                                      fontSize: 35,
                                    ),
                                  ),
                                  SizedBox(height: 30),
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
                                  SizedBox(height: 10),
                                  Divider(),
                                  SizedBox(height: 20),
                                  Text(
                                    '(Disponível apenas no plano anual)',
                                    style: TextStyle(
                                      fontFamily: 'Body',
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic,
                                      // color: Colors.grey[800],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // SizedBox(width: 30),
                // Card(
                //   elevation: 3,
                //   child: Container(
                //     padding:
                //         EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
                //     width: 300,
                //     height: 600,
                //     child: Column(
                //       children: <Widget>[
                //         Text(
                //           'Anual',
                //           style: TextStyle(
                //             fontFamily: 'Title',
                //             fontSize: 35,
                //           ),
                //         ),
                //         SizedBox(height: 30),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: <Widget>[
                //             Checkbox(
                //               onChanged: (bool resp) {
                //                 setState(() {
                //                   x = resp;
                //                   y = false;
                //                 });
                //               },
                //               value: x,
                //             ),
                //             Text(
                //               'Básico',
                //               style: TextStyle(
                //                 fontFamily: 'SubTitle',
                //                 fontSize: 25,
                //                 color: Colors.grey[800],
                //               ),
                //             ),
                //           ],
                //         ),
                //         Divider(),
                //         SizedBox(height: 10),
                //         Text(
                //           'Perfil Empresarial',
                //           style: TextStyle(
                //             fontFamily: 'Body',
                //             fontSize: 15,
                //             // color: Colors.grey[800],
                //           ),
                //         ),
                //         SizedBox(height: 10),
                //         Wrap(
                //           crossAxisAlignment: WrapCrossAlignment.center,
                //           children: <Widget>[
                //             Text(
                //               'R\$ ',
                //               style: TextStyle(
                //                 fontFamily: 'Body',
                //                 color: Colors.grey,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 20,
                //               ),
                //             ),
                //             Text(
                //               '200,00',
                //               style: TextStyle(
                //                 fontFamily: 'Body',
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 35,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(height: 30),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: <Widget>[
                //             Checkbox(
                //               onChanged: (bool resp) {
                //                 setState(() {
                //                   y = resp;
                //                   x = false;
                //                 });
                //               },
                //               value: y,
                //             ),
                //             Text(
                //               'Pro',
                //               style: TextStyle(
                //                 fontFamily: 'SubTitle',
                //                 fontSize: 25,
                //                 color: Colors.grey[800],
                //               ),
                //             ),
                //           ],
                //         ),
                //         Divider(),
                //         SizedBox(height: 10),
                //         Text(
                //           'Perfil Empresarial',
                //           style: TextStyle(
                //             fontFamily: 'Body',
                //             fontSize: 15,
                //             // color: Colors.grey[800],
                //           ),
                //         ),
                //         SizedBox(height: 10),
                //         Text(
                //           'Publicação ilimitada de ofertas',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //             fontFamily: 'Body',
                //             fontSize: 15,
                //             // color: Colors.grey[800],
                //           ),
                //         ),
                //         SizedBox(height: 10),
                //         Wrap(
                //           crossAxisAlignment: WrapCrossAlignment.center,
                //           children: <Widget>[
                //             Text(
                //               'R\$ ',
                //               style: TextStyle(
                //                 fontFamily: 'Body',
                //                 color: Colors.grey,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 20,
                //               ),
                //             ),
                //             Text(
                //               '3000,00',
                //               style: TextStyle(
                //                 fontFamily: 'Body',
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 35,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(height: 30),
                //         Container(
                //           decoration: BoxDecoration(
                //             gradient: LinearGradient(
                //               colors: [
                //                 Color(0xFFFF8A65),
                //                 Color(0xFFFF5722),
                //                 Color(0xFFD84315)
                //               ],
                //             ),
                //             borderRadius: BorderRadius.circular(6.0),
                //             boxShadow: [
                //               BoxShadow(
                //                   color: Color(0xFF6078ea).withOpacity(.3),
                //                   offset: Offset(0.0, 8.0),
                //                   blurRadius: 8.0)
                //             ],
                //           ),
                //           child: Material(
                //             color: Colors.transparent,
                //             child: FlatButton(
                //               onPressed: () {},
                //               child: Center(
                //                 child: Text(
                //                   "Comprar",
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontFamily: "Poppins-Bold",
                //                       fontSize: 18,
                //                       letterSpacing: 1.0),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  width: 30,
                  height: 100,
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF8A65),
                  Color(0xFFFF5722),
                  Color(0xFFD84315)
                ],
              ),
              borderRadius: BorderRadius.circular(3.0),
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
                    "Prosseguir",
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
      ],)
    );
  }
}

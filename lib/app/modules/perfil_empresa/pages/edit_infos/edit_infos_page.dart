import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:load/load.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ofertas/app/modules/perfil_empresa/perfil_empresa_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/repositories/sign_up_company/signup_company_controller.dart';

class EditInfosPage extends StatefulWidget {
  final String title;
  const EditInfosPage({Key key, this.title = "EditInfos"}) : super(key: key);

  @override
  _EditInfosPageState createState() => _EditInfosPageState();
}

class _EditInfosPageState extends State<EditInfosPage> {
  PerfilEmpresaController controller = Modular.get();
  SignUpCompanyController signUpCompanyController = Modular.get();

  //Mascaras
  var maskCep = MaskTextInputFormatter(
      filter: {"#": RegExp(r'[0-9]')}, mask: "#####-###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Colors.orange[900],
            Colors.orange[300],
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Column(
                            children: <Widget>[
                              Text("Foto de perfil"),
                              SizedBox(height: 20),
                              Divider(color: Colors.black, height: 6),
                            ],
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text("ESCOLHER FOTO"),
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    var img = await controller.getImage(0);
                                    // await Future.delayed(
                                    //     Duration(seconds: 1));
                                    showLoadingDialog();
                                    await controller.uploadImage(
                                      controller.empresa.empresaID,
                                      controller.empresa.foto,
                                      img,
                                    );
                                    hideLoadingDialog();
                                    controller.fetchPage();
                                  },
                                ),
                                ListTile(
                                  title: Text("TIRAR FOTO"),
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    var img = await controller.getImage(1);
                                    // await Future.delayed(
                                    //     Duration(seconds: 1));
                                    showLoadingDialog();
                                    await controller.uploadImage(
                                      controller.empresa.empresaID,
                                      controller.empresa.foto,
                                      img,
                                    );
                                    hideLoadingDialog();
                                    controller.fetchPage();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2.0),
                      borderRadius: BorderRadius.circular(90),
                      color: controller.empresa == null
                          ? Colors.grey[300]
                          : Colors.transparent,
                      image: controller.empresa != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: controller.empresa.foto != null
                                  ? NetworkImage(
                                      controller.empresa.foto,
                                    )
                                  : AssetImage(
                                      'assets/mogi.png',
                                    ),
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "  Nome da empresa",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: controller.empresa.nomeEmpresa,
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "  Email para contato",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: controller.empresa.email,
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "  Telefone para contato",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: controller.empresa.telefone,
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "  CEP",
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width - 100,
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            inputFormatters: [maskCep],
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText: controller.empresa.cep,
                            ),
                            keyboardType: TextInputType.number,
                          );
                        },
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          //Validate cep
                          // controller.signUpCompanyController.validateCep();
                          // if (controller.signUpCompanyController.erroCep)
                          //   return;
                          // showLoadingDialog();
                          // await controller.signUpCompanyController.fetchCep();
                          // hideLoadingDialog();
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "  Endereço",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: controller.empresa.logradouro,
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "  Endereço",
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText: controller.empresa.bairro,
                            ),
                            keyboardType: TextInputType.text,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText: controller.empresa.estado,
                            ),
                            keyboardType: TextInputType.text,
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText: controller.empresa.complemento != ""
                                  ? controller.empresa.complemento
                                  : "Complemento",
                            ),
                            keyboardType: TextInputType.text,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Observer(
                        builder: (_) {
                          return TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                              hintText: controller.empresa.numero,
                            ),
                            keyboardType: TextInputType.text,
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(width: 15),
                Text(
                  "  Site",
                  textAlign: TextAlign.left,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: controller.empresa.site != ""
                        ? controller.empresa.site
                        : "Site",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 8),
                ButtonWidget(
                  height: 50,
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width - 80,
                  onTap: () {},
                  text: "SALVAR",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

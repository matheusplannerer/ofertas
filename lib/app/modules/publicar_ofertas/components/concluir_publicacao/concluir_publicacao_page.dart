import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ofertas/app/modules/publicar_ofertas/components/concluir_publicacao/concluir_publicacao_controller.dart';
import 'package:ofertas/app/shared/components/button/button_widget.dart';
import 'package:ofertas/app/shared/models/oferta_model.dart';

class ConcluirPublicacaoPage extends StatefulWidget {
  final OfertaModel oferta;
  final String title;
  const ConcluirPublicacaoPage(
      {Key key, this.title = "ConcluirPublicacao", this.oferta})
      : super(key: key);

  @override
  _ConcluirPublicacaoPageState createState() => _ConcluirPublicacaoPageState();
}

class _ConcluirPublicacaoPageState extends State<ConcluirPublicacaoPage> {
  OfertaModel oferta;

  var controller = ConcluirPublicacaoController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oferta = widget.oferta;
  }

  @override
  Widget build(BuildContext context) {
    // print(oferta.infos);
    // print(oferta.mostrar);
    // print(oferta.nomeProduto);
    print(oferta.bs64ImgAux);
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
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  child: oferta?.imgFileAux != null
                      ? Image.file(
                          oferta?.imgFileAux,
                          fit: BoxFit.fitWidth,
                        )
                      : Image.memory(base64Decode(oferta?.bs64ImgAux)),
                ),
                SizedBox(
                  height: 50,
                ),
                if (oferta.nomeProduto != null)
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: "Nome do Produto: ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: oferta.nomeProduto,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                if (oferta.preco != null)
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: "Valor sem desconto: ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: "R\$${oferta.preco}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                if (oferta.desconto != null)
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: "Valor com desconto: ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: "R\$${oferta.desconto}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                if (oferta.validade != null)
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: "Válido até: ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text:
                              "${oferta.validade.toDate().day}/${oferta.validade.toDate().month}/${oferta.validade.toDate().year}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                if (oferta.infos != null)
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: "Informações adicionais: ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                      children: [
                        TextSpan(
                          text: oferta.infos,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20),
                ButtonWidget(
                  height: 40,
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 60,
                  onTap: () {
                    // Modular.navigatorKey.currentState.pushNamed('');
                  },
                  text: "AVANÇAR",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:load/load.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PagamentoPage extends StatefulWidget {
  final String title;
  const PagamentoPage({Key key, this.title = "Pagamento"}) : super(key: key);

  @override
  _PagamentoPageState createState() => _PagamentoPageState();
}

class _PagamentoPageState extends State<PagamentoPage> {
  static const platform = const MethodChannel('flutter.native');
  String _response = '';
  Future<Null> _handleCallback() async {
    String response = "";
    try {
      final dynamic creditCard =
          await platform.invokeMethod('helloFromNativeCode');
      print(creditCard);
      // var response = await Dio().post(
      //     "https://us-central1-ofertas-8428f.cloudfunctions.net/createAssinante",
      //     data: {'crc': creditCard});
      // print("response: ${response.data}");
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RaisedButton(
        onPressed: () async {
          _handleCallback();
          // Dio http = Dio();
          // AppController appController = Modular.get();
          // var texto = "MEU TEXTO COM CARTAO";

          // var privateKey = base64.encode(utf8.encode(texto));

          // print(privateKey);

          // showLoadingDialog(tapDismiss: false);
          //criar assinante
          // var urlCreateAssinante =
          //     "https://us-central1-ofertas-8428f.cloudfunctions.net/createAssinante";

          // var encryptedData = {
          //   "data": privateKey,
          // };

          // var response =
          //     await http.post(urlCreateAssinante, data: encryptedData);
          // print(response.data);

          // var dataCreateAssinante = {
          //   "uid": appController.userInfos.id,
          //   "email": appController.userInfos.email,
          //   "fullname": appController.userInfos.nome,
          //   "cpf": "22222222222",
          //   "phone_area_code": "16",
          //   "phone_number": "997795620",
          //   "birthdate_day": "04",
          //   "birthdate_month": "03",
          //   "birthdate_year": "1999",
          //   "address": {
          //     "street": "Rua Nome da Rua",
          //     "number": "100",
          //     "complement": "Casa",
          //     "district": "Nome do Bairro",
          //     "city": "São Paulo",
          //     "state": "SP",
          //     "country": "BRA",
          //     "zipcode": "05015010"
          //   },
          //   "billing_info": {
          //     "credit_card": {
          //       "holder_name": "Nome Completo",
          //       "number": "4111111111111111",
          //       "expiration_month": "06",
          //       "expiration_year": "22"
          //     }
          //   }
          // };

          // var responseCreateAssinante =
          //     await http.post(urlCreateAssinante, data: dataCreateAssinante);

          // print(responseCreateAssinante.data);

          // var urlCreateAssinatura =
          //     "https://us-central1-ofertas-8428f.cloudfunctions.net/createAssinatura";
          // String codeAssinatura = appController.userInfos.email
          //     .replaceAll("@", "-")
          //     .replaceAll(".", "-");
          // var dataCreateAssinatura = {
          //   "code": "${codeAssinatura}_16",
          //   "plan_code": "plan102",
          //   "customer_code": appController.userInfos.id,
          // };

          // var responseCreateAssinatura =
          //     await http.post(urlCreateAssinatura, data: dataCreateAssinatura);
          // print("${responseCreateAssinatura.data}");
          // hideLoadingDialog();
        },
        child: Text("Comprar"),
      ),
    );
  }
}

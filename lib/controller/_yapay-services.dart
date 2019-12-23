import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YapayServices {
  int codigoEstabelecimento = 1576690328782;
  String base64Credentials = base64Encode(utf8.encode("BrunoArantes:Pjn%4NG7"));
  _TabelaFormaPagamento formaPagamento = _TabelaFormaPagamento();

  Future<bool> pagarCredito(double valor, FirebaseUser fbUser) async {
    var docs = await Firestore.instance.collection('transacao').getDocuments();
    var numeroTransacao = docs.documents[0].data['numeroTransacao'];

    Dio dio = Dio();

    Map<String, dynamic> header = {
      "Authorization": "Basic $base64Credentials",
    };

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e) {
          //Erro
          print("ERROR");
          print(e.message);
        },
        onRequest: (e) {
          //Antes de enviar
          print("REQUEST:");
          print(e.data);
        },
        onResponse: (e) async {
          //Resposta
          print("RESPONSE");
          print(e);
        },
      ),
    );

    Options opts = Options(
      headers: header,
      contentType: "application/json",
    );

    //Cartões para teste - https://gateway.dev.yapay.com.br/#/sandbox

    //Descrição de cada campo pode ser encontrado em - https://gateway.dev.yapay.com.br/#/tabela-cartoes-credito?id=transa%c3%a7%c3%a3o-simplificada
    Map<String, dynamic> data = {
      "codigoEstabelecimento": codigoEstabelecimento,
      "codigoFormaPagamento": formaPagamento
          .visaCredito, //TABELADO - https://gateway.dev.yapay.com.br/#/tabela-forma-pagamento
      "transacao": {
        "numeroTransacao":
            numeroTransacao, //Código qualquer até 19 dígitos ou 16 para E-Rede
        "valor": valor, //Valor da transação (sem pontos ou virgulas)
        "parcelas": 1,
      },
      "dadosCartao": {
        "nomePortador": "Teste Teste",
        "numeroCartao": "0000000000000001",
        "codigoSeguranca": "123",
        "dataValidade": "12/2030"
      },
      "itensDoPedido": [
        {
          "quantidadeProduto": 1,
          "valorUnitarioProduto": valor,
        }
      ],
      "dadosCobranca": {"nome": "Teste Integração", "documento": "12312312312"}
    };

    try {
      var response = await dio.post(
        "https://sandbox.gateway.yapay.com.br/checkout/api/v3/transacao",
        data: data,
        options: opts,
      );
      if (response.statusCode == 200) {
        var data = await Firestore.instance
            .collection('carteira')
            .document(fbUser.uid)
            .get();
        final valor = data.data['carteira'] + response.data['valor'];
        await Firestore.instance
            .collection('carteira')
            .document(fbUser.uid)
            .updateData({'carteira': valor});
        await Firestore.instance
            .collection('transacao')
            .document("9MpB3hc15ehEgytgdO70")
            .updateData({'numeroTransacao': numeroTransacao + 1});
        print("ATUALIZADO!");
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Response> pagarBoleto(FirebaseUser fbUser,
      {String nome, double valor}) async {
    Dio dio = Dio();

    var docs = await Firestore.instance.collection('transacao').getDocuments();
    var numeroTransacao = docs.documents[0].data['numeroTransacao'];

    Map<String, dynamic> header = {
      "Authorization": "Basic $base64Credentials",
    };

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e) {
          //Erro
          print("ERROR");
          print(e.message);
        },
        onRequest: (e) {
          //Antes de enviar
          print("REQUEST:");
          print(e.data);
        },
        onResponse: (e) async {
          // //Resposta
          print("RESPONSE");
          print(e.statusCode);
        },
      ),
    );

    Options opts = Options(
      headers: header,
      contentType: "application/json",
    );

    Map<String, dynamic> data = {
      "codigoEstabelecimento": codigoEstabelecimento,
      "codigoFormaPagamento":
          29, // https://gateway.dev.yapay.com.br/#/tabela-forma-pagamento
      "transacao": {
        "numeroTransacao": numeroTransacao,
        "valor": valor,
        "urlResultado": "http://www.google.com.br",
        "dataVencimentoBoleto": "13/12/2030"
      },
      "itensDoPedido": [
        {
          "codigoProduto": 1,
          "nomeProduto": "Produto 1",
          "codigoCategoria": 1,
          "nomeCategoria": "categoria",
          "quantidadeProduto": 1,
          "valorUnitarioProduto": valor
        }
      ],
      "dadosCobranca": {
        "codigoCliente": 1,
        "tipoCliente": 1,
        "nome": nome,
        "email": "teste@teste.com",
        "dataNascimento": "10/01/1975",
        "sexo": "M",
        "documento": "12312312312",
        "endereco": {
          "logradouro": "Rua",
          "numero": "123",
          "complemento": "",
          "cep": "12345-678",
          "bairro": "Bairro",
          "cidade": "Cidade",
          "estado": "SP",
          "pais": "BR"
        }
      }
    };

    // https://gateway.dev.yapay.com.br/#/tabela-boletos campos do boleto

    try {
      var response = await dio.post(
          "https://sandbox.gateway.yapay.com.br/checkout/api/v3/transacao",
          options: opts,
          data: data);
      var carteira = await Firestore.instance
          .collection('carteira')
          .document(fbUser.uid)
          .get();
      final valor = carteira.data['carteira'] + response.data['valor'];
      await Firestore.instance
          .collection('carteira')
          .document(fbUser.uid)
          .updateData({'carteira': valor});
      await Firestore.instance
          .collection('transacao')
          .document("9MpB3hc15ehEgytgdO70")
          .updateData({'numeroTransacao': numeroTransacao + 1});
      print("ATUALIZADO!");
      return response;
    } catch (e) {
      return null;
    }
  }
}

class _TabelaFormaPagamento {
  //Adquirente: CIELO
  int visaCredito = 170;
  int masterCardCredito = 171;
  int visaElectronCredito = 179;
}

import 'package:cloud_firestore/cloud_firestore.dart';

class PlanosModel {
  PlanosModel({
    this.plano,
    this.postsLeft,
    this.profileNumberLeft,
    this.endDate,
    this.hireDate,
    this.id,
    this.valuePerMonth,
    this.valueTotal,
    this.numeroParcelas,
  });

  AccountPlanos plano;
  int postsLeft;
  int profileNumberLeft;
  Timestamp hireDate;
  Timestamp endDate;
  double valuePerMonth;
  String id;
  double valueTotal;
  int numeroParcelas;

  factory PlanosModel.fromJson(DocumentSnapshot document) {
    AccountPlanos planoAux;
    int postsLeftAux;
    int profileNumberLeftAux;
    double valuePerMonthAux;

    if (document.data['plano'] == "basico") {
      planoAux = AccountPlanos.basico;
      //
      postsLeftAux = 0;
      profileNumberLeftAux = 0;
      valuePerMonthAux = 0;
    }
    if (document.data['plano'] == "pro") {
      planoAux = AccountPlanos.pro;
      postsLeftAux = document.data['postsLeft'];
      profileNumberLeftAux = document.data['profileNumberLeft'];
      valuePerMonthAux = document.data['valuePerMonth'];
    }
    if (document.data['plano'] == "master") {
      planoAux = AccountPlanos.master;
      profileNumberLeftAux = document.data['profileNumberLeft'];
      postsLeftAux = document.data['postsLeft'];
      valuePerMonthAux = document.data['valuePerMonth'];
    }
    return PlanosModel(
      plano: planoAux,
      postsLeft: postsLeftAux,
      profileNumberLeft: profileNumberLeftAux,
      hireDate: document.data['hireDate'],
      endDate: document.data['endDate'],
      id: document.data['id'],
      valuePerMonth: valuePerMonthAux,
      valueTotal: document.data['valueTotal'],
      numeroParcelas: document.data['numeroParcelas'],
      //field: json[''],
    );
  }

  Map<String, dynamic> toJson() {
    String planoAux;
    if (plano == AccountPlanos.basico) planoAux = "basico";
    if (plano == AccountPlanos.pro) planoAux = "pro";
    if (plano == AccountPlanos.master) planoAux = "master";
    return {
      'plano': planoAux,
      'postsLeft': postsLeft,
      'profileNumberLeft': profileNumberLeft,
      'hireDate': hireDate,
      'endDate': endDate,
      'id': id,
      'valuePerMonth': valuePerMonth,
      'valueTotal': valueTotal,
      'numeroParcelas': numeroParcelas,
    };
  }

  PlanosModel copyWith({
    Timestamp endDate,
    Timestamp hireDate,
    String id,
    int numeroParcelas,
    int profileNumberLeft,
    double valuePerMonth,
    double valueTotal,
    int postsLeft,
    AccountPlanos plano,
  }) {
    return PlanosModel(
      endDate: endDate ?? this.endDate,
      hireDate: hireDate ?? this.hireDate,
      id: id ?? this.id,
      numeroParcelas: numeroParcelas ?? this.numeroParcelas,
      plano: plano ?? this.plano,
      postsLeft: postsLeft ?? this.postsLeft,
      profileNumberLeft: profileNumberLeft ?? this.profileNumberLeft,
      valuePerMonth: valuePerMonth ?? this.valuePerMonth,
      valueTotal: valueTotal ?? this.valueTotal,
    );
  }
}

enum AccountPlanos { basico, pro, master }

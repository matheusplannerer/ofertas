import 'package:ofertas/app/shared/models/planos_model.dart';

class PlanosAdminModel {
  bool canCreateProfile;
  bool canPost;
  int numberPosts;
  int numberProfile;
  AccountPlanos plano;
  Map<String, dynamic> valores;

  PlanosAdminModel({
    this.canCreateProfile,
    this.canPost,
    this.numberPosts,
    this.numberProfile,
    this.plano,
    this.valores,
  });

  factory PlanosAdminModel.fromJson(Map<String, dynamic> json) {
    AccountPlanos planoAux;
    if (json['plano'] == "basico") planoAux = AccountPlanos.basico;
    if (json['plano'] == "pro") planoAux = AccountPlanos.pro;
    if (json['plano'] == "master") planoAux = AccountPlanos.master;
    return PlanosAdminModel(
      canCreateProfile: json['canCreateProfile'],
      canPost: json['canPost'],
      numberPosts: json['numberPosts'],
      numberProfile: json['numberProfile'],
      plano: planoAux,
      valores: json['valores'],
    );
  }

  Map<String, dynamic> toJson() {
    String planoAux;
    if (plano == AccountPlanos.basico) planoAux = 'basico';
    if (plano == AccountPlanos.pro) planoAux = 'pro';
    if (plano == AccountPlanos.master) planoAux = 'master';
    return {
      'canCreateProfile': canCreateProfile,
      'canPost': canPost,
      'numberPosts': numberPosts,
      'numberProfile': numberProfile,
      'plano': planoAux,
      'valores': valores,
    };
  }
}

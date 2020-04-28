import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:ofertas/app/shared/models/cupom_model.dart';
import 'package:ofertas/app/shared/models/planos_admin_model.dart';
import 'package:ofertas/app/shared/models/planos_model.dart';
import 'package:ofertas/app/shared/repositories/planos_services/repositories/planos_services_repository_interface.dart';

class PlanosRepository implements IPlanosRepository {
  @override
  Future<Map<int, dynamic>> applyCupom(
      String cupom, PlanosModel actualPlan) async {
    // 0 - plano
    // 1 - desconto
    try {
      var doc =
          await Firestore.instance.collection('cupom').document(cupom).get();
      if (!doc.exists) throw PlatformException(code: "CUPOM_DONT_EXIST");
      CupomModel cupomAux = CupomModel.fromJson(doc.data);
      double newValueTotal;
      double newValuePerMonth;
      double desconto;
      if (cupomAux.isAbsolut) {
        newValueTotal = actualPlan.valueTotal - cupomAux.value;
        newValuePerMonth = double.tryParse(
            (newValueTotal / actualPlan.numeroParcelas).toStringAsFixed(2));
        desconto = cupomAux.value.toDouble();
      } else if (cupomAux.isPercentage) {
        newValueTotal = actualPlan.valueTotal * (1 - cupomAux.value / 100);
        desconto = double.tryParse(
            (actualPlan.valueTotal * cupomAux.value / 100).toStringAsFixed(2));
        newValuePerMonth = double.tryParse(
            (newValueTotal / actualPlan.numeroParcelas).toStringAsFixed(2));
      }
      actualPlan = actualPlan.copyWith(
          valueTotal: newValueTotal, valuePerMonth: newValuePerMonth);
      return {0: actualPlan, 1: desconto};
    } catch (e) {
      return throw e;
    }
  }

  @override
  Future<Map<String, PlanosAdminModel>> getPlanos() async {
    Map<String, PlanosAdminModel> planosAux = {};
    try {
      var docs = await Firestore.instance.collection('planos').getDocuments();
      for (var i = 0; i < docs.documents.length; i++) {
        PlanosAdminModel aux =
            PlanosAdminModel.fromJson(docs.documents[i].data);
        planosAux.putIfAbsent(docs.documents[i].data['plano'], () => aux);
        planosAux.update(docs.documents[i].data['plano'], (v) => aux);
      }
      return planosAux;
    } catch (e) {
      print(e);
      return throw e;
    }
  }

  @override
  Future setPlano(PlanosModel plano, FirebaseUser user) async {
    try {
      plano.id = Firestore.instance
          .collection('usuarios')
          .document(user.uid)
          .collection('planos')
          .document()
          .documentID;

      await Firestore.instance
          .collection('usuarios')
          .document(user.uid)
          .collection('planos')
          .document(plano.id)
          .setData(plano.toJson());
      await Firestore.instance
          .collection('usuarios')
          .document(user.uid)
          .updateData({"planoId": plano.id});
    } catch (e) {
      return throw e;
    }
  }
}

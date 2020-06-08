import 'package:firebase_auth/firebase_auth.dart';
import 'package:ofertas/app/shared/models/planos_admin_model.dart';
import 'package:ofertas/app/shared/models/planos_model.dart';
import 'package:ofertas/app/shared/models/user_model.dart';

abstract class IPlanosRepository {
  Future<Map<String, PlanosAdminModel>> getPlanos();
  Future<Map<int, dynamic>> applyCupom(String cupom, PlanosModel actualPlan);
  Future setPlano(PlanosModel plano, FirebaseUser user);
  Future updatePlano(PlanosModel plano, FirebaseUser user);
}

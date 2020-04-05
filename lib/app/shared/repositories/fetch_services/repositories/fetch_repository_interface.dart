import 'package:mobx/mobx.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

abstract class IFetchRepository {
  Future<PerfilEmpresaModel> fetchEmpresa(String uid);
  Future<ObservableList> fetchOfertas(String uid);
  // Future<ObservableList
}

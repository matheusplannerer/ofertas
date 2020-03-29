import 'package:ofertas/app/shared/models/endereco_model.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

abstract class ISignUpCompanyRepository {
  Future<EnderecoModel> fetchCep(String cep);
  signUpCompany(PerfilEmpresaModel model);
}

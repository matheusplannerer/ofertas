import 'package:ofertas/app/modules/cadastro_empresa/cadastro_empresa_page.dart';
import 'package:ofertas/app/modules/cadastro_empresa/services/cadastro_empresa_service.dart';
import 'package:ofertas/app/modules/cadastro_empresa/services/via_cep_service.dart';
import 'package:ofertas/app/modules/cadastro_empresa/cadastro_empresa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroEmpresaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CadastroEmpresaService()),
        Bind((i) => ViaCepService()),
        Bind((i) => CadastroEmpresaController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CadastroEmpresaPage()),
      ];

  static Inject get to => Inject<CadastroEmpresaModule>.of();
}

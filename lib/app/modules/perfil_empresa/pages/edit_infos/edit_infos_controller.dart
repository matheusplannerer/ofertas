import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/modules/perfil_empresa/pages/horarios/horarios_controller.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

part 'edit_infos_controller.g.dart';

class EditInfosController = _EditInfosControllerBase with _$EditInfosController;

abstract class _EditInfosControllerBase with Store {
  @observable
  PerfilEmpresaModel empresa;

  @action
  void initEmpresa(PerfilEmpresaModel value) => empresa = PerfilEmpresaModel(
        bairro: value.bairro,
        categoria: value.categoria,
        cep: value.cep,
        complemento: value.complemento,
        dias: value.dias,
        donoEmpresa: value.donoEmpresa,
        email: value.email,
        empresaID: value.empresaID,
        estado: value.estado,
        foto: value.foto,
        horarios: value.horarios,
        lat: value.lat,
        logradouro: value.logradouro,
        lon: value.lon,
        nomeEmpresa: value.nomeEmpresa,
        numero: value.numero,
        ofertas: value.ofertas,
        site: value.site,
        subcategoria: value.subcategoria,
        telefone: value.telefone,
      );

  @action
  Future updateEmpresa() async {
    try {
      HorariosController horariosController = Modular.get();
      await horariosController.updateHorarios(empresa);
      await Firestore.instance
          .collection('empresas')
          .document(empresa.empresaID)
          .updateData(empresa.toJson());
    } catch (e) {
      return throw e;
    }
  }
}

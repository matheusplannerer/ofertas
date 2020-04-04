import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:ofertas/app/app_controller.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';
import 'package:ofertas/app/shared/repositories/auth/auth_controller.dart';
import 'package:ofertas/app/shared/repositories/routes/route_controller.dart';

part 'horarios_controller.g.dart';

class HorariosController = _HorariosBase with _$HorariosController;

abstract class _HorariosBase with Store {
  AuthController authController = Modular.get();
  RouteController routeController = Modular.get();
  AppController appController = Modular.get();

  TextEditingController segundaTextFieldInicio = TextEditingController();
  TextEditingController segundaTextFieldFim = TextEditingController();
  TextEditingController tercaTextFieldInicio = TextEditingController();
  TextEditingController tercaTextFieldFim = TextEditingController();
  TextEditingController quartaTextFieldInicio = TextEditingController();
  TextEditingController quartaTextFieldFim = TextEditingController();
  TextEditingController quintaTextFieldInicio = TextEditingController();
  TextEditingController quintaTextFieldFim = TextEditingController();
  TextEditingController sextaTextFieldInicio = TextEditingController();
  TextEditingController sextaTextFieldFim = TextEditingController();
  TextEditingController sabadoTextFieldInicio = TextEditingController();
  TextEditingController sabadoTextFieldFim = TextEditingController();
  TextEditingController domingoTextFieldInicio = TextEditingController();
  TextEditingController domingoTextFieldFim = TextEditingController();

  MaskTextInputFormatter maskSegIni = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskSegFim = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskTerIni = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskTerFim = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskQuaIni = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskQuaFim = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskQuiIni = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskQuiFim = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskSexIni = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskSexFim = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskSabIni = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskSabFim = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskDomIni = MaskTextInputFormatter(mask: "##:##");
  MaskTextInputFormatter maskDomFim = MaskTextInputFormatter(mask: "##:##");

  void updateFields(PerfilEmpresaModel model) {
    if (model.horarios != null && model.dias != null) {
      setSegunda(model.dias['seg'] ?? false);
      setTerca(model.dias['ter'] ?? false);
      setQuarta(model.dias['qua'] ?? false);
      setQuinta(model.dias['qui'] ?? false);
      setSexta(model.dias['sex'] ?? false);
      setSabado(model.dias['sab'] ?? false);
      setDomingo(model.dias['dom'] ?? false);
      segundaTextFieldInicio =
          TextEditingController(text: model.horarios['segInicio'] ?? '');
      segundaTextFieldFim =
          TextEditingController(text: model.horarios['segFim'] ?? '');

      tercaTextFieldInicio =
          TextEditingController(text: model.horarios['terInicio'] ?? '');
      tercaTextFieldFim =
          TextEditingController(text: model.horarios['terFim'] ?? '');

      quartaTextFieldInicio =
          TextEditingController(text: model.horarios['quaInicio'] ?? '');
      quartaTextFieldFim =
          TextEditingController(text: model.horarios['quaFim'] ?? '');

      quintaTextFieldInicio =
          TextEditingController(text: model.horarios['quiInicio'] ?? '');
      quintaTextFieldFim =
          TextEditingController(text: model.horarios['quiFim'] ?? '');

      sextaTextFieldInicio =
          TextEditingController(text: model.horarios['sexInicio'] ?? '');
      sextaTextFieldFim =
          TextEditingController(text: model.horarios['sexFim'] ?? '');

      sabadoTextFieldInicio =
          TextEditingController(text: model.horarios['sabInicio'] ?? '');
      sabadoTextFieldFim =
          TextEditingController(text: model.horarios['sabFim'] ?? '');

      domingoTextFieldInicio =
          TextEditingController(text: model.horarios['domInicio'] ?? '');
      domingoTextFieldFim =
          TextEditingController(text: model.horarios['domFim'] ?? '');
    } else {
      var aux = PerfilEmpresaModel();
      segundaTextFieldInicio =
          TextEditingController(text: aux.horarios['segInicio']);
      segundaTextFieldFim = TextEditingController(text: aux.horarios['segFim']);

      tercaTextFieldInicio =
          TextEditingController(text: aux.horarios['terInicio']);
      tercaTextFieldFim = TextEditingController(text: aux.horarios['terFim']);

      quartaTextFieldInicio =
          TextEditingController(text: aux.horarios['quaInicio']);
      quartaTextFieldFim = TextEditingController(text: aux.horarios['quaFim']);

      quintaTextFieldInicio =
          TextEditingController(text: aux.horarios['quiInicio']);
      quintaTextFieldFim = TextEditingController(text: aux.horarios['quiFim']);

      sextaTextFieldInicio =
          TextEditingController(text: aux.horarios['sexInicio']);
      sextaTextFieldFim = TextEditingController(text: aux.horarios['sexFim']);

      sabadoTextFieldInicio =
          TextEditingController(text: aux.horarios['sabInicio']);
      sabadoTextFieldFim = TextEditingController(text: aux.horarios['sabFim']);

      domingoTextFieldInicio =
          TextEditingController(text: aux.horarios['domInicio']);
      domingoTextFieldFim = TextEditingController(text: aux.horarios['domFim']);
    }
  }

  @observable
  bool _domingo = false;
  @observable
  bool _segunda = false;
  @observable
  bool _terca = false;
  @observable
  bool _quarta = false;
  @observable
  bool _quinta = false;
  @observable
  bool _sexta = false;
  @observable
  bool _sabado = false;

  @computed
  bool get domingo => _domingo;
  @computed
  bool get segunda => _segunda;
  @computed
  bool get terca => _terca;
  @computed
  bool get quarta => _quarta;
  @computed
  bool get quinta => _quinta;
  @computed
  bool get sexta => _sexta;
  @computed
  bool get sabado => _sabado;

  @action
  void setSegunda(bool value) => _segunda = value;

  @action
  void setTerca(bool value) => _terca = value;

  @action
  void setQuarta(bool value) => _quarta = value;

  @action
  void setQuinta(bool value) => _quinta = value;

  @action
  void setSexta(bool value) => _sexta = value;

  @action
  void setSabado(bool value) => _sabado = value;

  @action
  void setDomingo(bool value) => _domingo = value;

  Future<PerfilEmpresaModel> updateHorarios(PerfilEmpresaModel empresa) async {
    Map<String, dynamic> horarios = {
      'segInicio': segunda ? segundaTextFieldInicio.text : null,
      'segFim': segunda ? segundaTextFieldFim.text : null,
      'terInicio': terca ? tercaTextFieldInicio.text : null,
      'terFim': terca ? tercaTextFieldFim.text : null,
      'quaInicio': quarta ? quartaTextFieldInicio.text : null,
      'quaFim': quarta ? quartaTextFieldFim.text : null,
      'quiInicio': quinta ? quintaTextFieldInicio.text : null,
      'quiFim': quinta ? quintaTextFieldFim.text : null,
      'sexInicio': sexta ? sextaTextFieldInicio.text : null,
      'sexFim': sexta ? sextaTextFieldFim.text : null,
      'sabInicio': sabado ? sabadoTextFieldInicio.text : null,
      'sabFim': sabado ? sabadoTextFieldFim.text : null,
      'domInicio': domingo ? domingoTextFieldInicio.text : null,
      'domFim': domingo ? domingoTextFieldFim.text : null,
    };

    Map<String, dynamic> dias = {
      'seg': segunda,
      'ter': terca,
      'qua': quarta,
      'qui': quinta,
      'sex': sexta,
      'sab': sabado,
      'dom': domingo,
    };

    try {
      await Firestore.instance
          .collection('empresas')
          .document(empresa.empresaID)
          .updateData({
        'horarios': horarios,
        'dias': dias,
      });

      empresa.horarios = horarios;
      empresa.dias = dias;
      return empresa;
    } catch (e) {
      return null;
    }
  }
}

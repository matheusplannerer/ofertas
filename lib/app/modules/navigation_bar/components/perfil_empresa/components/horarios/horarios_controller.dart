import 'package:mobx/mobx.dart';

part 'horarios_controller.g.dart';

class HorariosController = _HorariosBase with _$HorariosController;

abstract class _HorariosBase with Store {
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
}

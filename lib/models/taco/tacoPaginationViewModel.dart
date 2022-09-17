import 'package:json_annotation/json_annotation.dart';

part 'tacoPaginationViewModel.g.dart';

@JsonSerializable()
class TacoPaginationViewModel {
  List<Data>? data;
  int? total;

  TacoPaginationViewModel({this.data, this.total});

  static const fromJsonFactory = _$TacoPaginationViewModelFromJson;

  Map<String, dynamic> toJson() => _$TacoPaginationViewModelToJson(this);
}

@JsonSerializable()
class Data {
  String? id;
  String descricao;
  int? baseQuantidade;
  int? baseUnidade;
  int? categoria;
  Atributos? atributos;
  Humidade? vitaminaC;
  Humidade? re;
  Humidade? rae;

  Data(
      {this.id,
      required this.descricao,
      this.baseQuantidade,
      this.baseUnidade,
      this.categoria,
      this.atributos,
      this.vitaminaC,
      this.re,
      this.rae});

  static const fromJson = _$DataFromJson;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Atributos {
  Humidade? humidade;
  Humidade? proteina;
  Humidade? lipidio;
  Humidade? colesterol;
  Humidade? carboidrato;
  Humidade? fibra;
  Humidade? cinzas;
  Humidade? calcio;
  Humidade? magnesio;
  Humidade? fosforo;
  Humidade? ferro;
  Humidade? sodio;
  Humidade? potassio;
  Humidade? cobre;
  Humidade? zinco;
  Humidade? retinol;
  Humidade? tiamina;
  Humidade? riboflavina;
  Humidade? piridoxina;
  Humidade? niacina;
  Energia? energia;
  AcidosGraxos? acidosGraxos;
  Humidade? manganes;
  Aminoacidos? aminoacidos;

  Atributos(
      {this.humidade,
      this.proteina,
      this.lipidio,
      this.colesterol,
      this.carboidrato,
      this.fibra,
      this.cinzas,
      this.calcio,
      this.magnesio,
      this.fosforo,
      this.ferro,
      this.sodio,
      this.potassio,
      this.cobre,
      this.zinco,
      this.retinol,
      this.tiamina,
      this.riboflavina,
      this.piridoxina,
      this.niacina,
      this.energia,
      this.acidosGraxos,
      this.manganes,
      this.aminoacidos});

  static const fromJson = _$AtributosFromJson;

  Map<String, dynamic> toJson() => _$AtributosToJson(this);
}

@JsonSerializable()
class Humidade {
  dynamic? quantidade;
  int? medida;

  Humidade({this.quantidade, this.medida});

  static const fromJson = _$HumidadeFromJson;

  Map<String, dynamic> toJson() => _$HumidadeToJson(this);
}

@JsonSerializable()
class Energia {
  dynamic? quilocaloria;
  dynamic? quilojoule;

  Energia({this.quilocaloria, this.quilojoule});

  static const fromJson = _$EnergiaFromJson;

  Map<String, dynamic> toJson() => _$EnergiaToJson(this);
}

@JsonSerializable()
class AcidosGraxos {
  Humidade? saturado;
  Humidade? monoinsaturado;
  Humidade? poliinsaturado;

  AcidosGraxos({this.saturado, this.monoinsaturado, this.poliinsaturado});

  static const fromJson = _$AcidosGraxosFromJson;

  Map<String, dynamic> toJson() => _$AcidosGraxosToJson(this);
}

@JsonSerializable()
class Aminoacidos {
  Humidade? triptofano;
  Humidade? treonina;
  Humidade? isoleucina;
  Humidade? leucina;
  Humidade? lisina;
  Humidade? metionina;
  Humidade? cistina;
  Humidade? fenilalanina;
  Humidade? tirosina;
  Humidade? valina;
  Humidade? arginina;
  Humidade? histidina;
  Humidade? alanina;
  Humidade? aspartico;
  Humidade? glutamico;
  Humidade? glicina;
  Humidade? prolina;
  Humidade? serina;

  Aminoacidos(
      {this.triptofano,
      this.treonina,
      this.isoleucina,
      this.leucina,
      this.lisina,
      this.metionina,
      this.cistina,
      this.fenilalanina,
      this.tirosina,
      this.valina,
      this.arginina,
      this.histidina,
      this.alanina,
      this.aspartico,
      this.glutamico,
      this.glicina,
      this.prolina,
      this.serina});

  static const fromJson = _$AminoacidosFromJson;

  Map<String, dynamic> toJson() => _$AminoacidosToJson(this);
}

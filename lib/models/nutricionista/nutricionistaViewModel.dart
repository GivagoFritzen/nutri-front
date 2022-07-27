import 'package:json_annotation/json_annotation.dart';

part 'nutricionistaViewModel.g.dart';

@JsonSerializable()
class NutricionistaViewModel {
  String? nome;
  String? sobrenome;
  String? email;
  String? cidade;
  String? telefone;
  bool? sexo;
  List<String>? pacientesIds;

  NutricionistaViewModel({
    this.nome,
    this.sobrenome,
    this.email,
    this.cidade,
    this.telefone,
    this.sexo,
    this.pacientesIds,
  });

  static const fromJsonFactory = _$NutricionistaViewModelFromJson;

  Map<String, dynamic> toJson() => _$NutricionistaViewModelToJson(this);
}
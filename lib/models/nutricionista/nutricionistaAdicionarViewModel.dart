import 'package:json_annotation/json_annotation.dart';

part 'nutricionistaAdicionarViewModel.g.dart';

@JsonSerializable()
class NutricionistaAdicionarViewModel {
  String? senha;
  String? nome;
  String? sobrenome;
  String? email;
  String? cidade;
  String? telefone;
  bool? sexo;

  NutricionistaAdicionarViewModel(
      {this.senha,
      this.nome,
      this.sobrenome,
      this.email,
      this.cidade,
      this.telefone,
      this.sexo});

  static const fromJsonFactory = _$NutricionistaAdicionarViewModelFromJson;

  Map<String, dynamic> toJson() =>
      _$NutricionistaAdicionarViewModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'nutricionistaAtualizarViewModel.g.dart';

@JsonSerializable()
class NutricionistaAtualizarViewModel {
  String? id;
  String? nome;
  String? sobrenome;
  String? email;
  String? cidade;
  String? telefone;
  bool? sexo;
  String? antigaSenha;
  String? novaSenha;

  NutricionistaAtualizarViewModel(
      {this.id,
      this.nome,
      this.sobrenome,
      this.email,
      this.cidade,
      this.telefone,
      this.sexo,
      this.antigaSenha,
      this.novaSenha});

  static const fromJsonFactory = _$NutricionistaAtualizarViewModelFromJson;

  Map<String, dynamic> toJson() =>
      _$NutricionistaAtualizarViewModelToJson(this);
}

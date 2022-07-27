import 'package:json_annotation/json_annotation.dart';

part 'pacienteAdicionarViewModel.g.dart';

@JsonSerializable()
class PacienteAdicionarViewModel {
  String? nome;
  String? sobrenome;
  String? email;
  String? cidade;
  String? telefone;
  bool? sexo;

  PacienteAdicionarViewModel(
      {this.nome,
        this.sobrenome,
        this.email,
        this.cidade,
        this.telefone,
        this.sexo});

  static const fromJsonFactory =
      _$PacienteAdicionarViewModelFromJson;

  Map<String, dynamic> toJson() =>
      _$PacienteAdicionarViewModelToJson(this);
}

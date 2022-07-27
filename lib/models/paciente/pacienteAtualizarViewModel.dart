import 'package:json_annotation/json_annotation.dart';

part 'pacienteAtualizarViewModel.g.dart';

@JsonSerializable()
class PacienteAtualizarViewModel {
  String nome;
  String sobrenome;
  String email;
  String cidade;
  String telefone;
  bool sexo;
  String id;

  PacienteAtualizarViewModel(
      {required this.nome,
      required this.sobrenome,
      required this.email,
      required this.cidade,
      required this.telefone,
      required this.sexo,
      required this.id});

  static const fromJsonFactory = _$PacienteAtualizarViewModelFromJson;

  Map<String, dynamic> toJson() => _$PacienteAtualizarViewModelToJson(this);
}

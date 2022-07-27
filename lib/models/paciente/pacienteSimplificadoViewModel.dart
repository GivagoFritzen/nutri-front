import 'package:json_annotation/json_annotation.dart';

part 'pacienteSimplificadoViewModel.g.dart';

@JsonSerializable()
class PacienteSimplificadoViewModel {
  String? id;
  String? nome;
  String? sobrenome;
  String? email;
  String? telefone;

  static const fromJsonFactory = _$PacienteSimplificadoViewModelFromJson;

  Map<String, dynamic> toJson() => _$PacienteSimplificadoViewModelToJson(this);
}

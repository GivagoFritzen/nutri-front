import 'package:json_annotation/json_annotation.dart';
import 'package:nutri/models/planoAlimentar/planoAlimentarViewModel.dart';

part 'pacienteAtualizarPlanoAlimentarViewModel.g.dart';

@JsonSerializable()
class PacienteAtualizarPlanoAlimentarViewModel {
  String? planoAlimentarId;
  PlanoAlimentarViewModel? planoAlimentar;

  PacienteAtualizarPlanoAlimentarViewModel(
      {this.planoAlimentarId, this.planoAlimentar});

  static const fromJsonFactory =
      _$PacienteAtualizarPlanoAlimentarViewModelFromJson;

  Map<String, dynamic> toJson() =>
      _$PacienteAtualizarPlanoAlimentarViewModelToJson(this);
}

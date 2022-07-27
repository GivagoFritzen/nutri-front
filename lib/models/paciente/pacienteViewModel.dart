import 'package:json_annotation/json_annotation.dart';
import 'package:nutri/models/medida/medidaViewModel.dart';
import 'package:nutri/models/planoAlimentar/planoAlimentarViewModel.dart';

part 'pacienteViewModel.g.dart';

@JsonSerializable()
class PacienteViewModel {
  String? id;
  String? nome;
  String? sobrenome;
  String? email;
  String? cidade;
  String? telefone;
  bool? sexo;
  List<MedidaViewModel>? medidas;
  List<PlanoAlimentarViewModel>? planoAlimentares;

  PacienteViewModel(
      {this.id,
      this.nome,
      this.sobrenome,
      this.email,
      this.cidade,
      this.telefone,
      this.sexo,
      this.medidas,
      this.planoAlimentares});

  static const fromJsonFactory = _$PacienteViewModelFromJson;

  Map<String, dynamic> toJson() => _$PacienteViewModelToJson(this);
}

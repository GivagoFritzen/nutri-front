import 'package:json_annotation/json_annotation.dart';
import 'package:nutri/models/refeicao/refeicaoViewModel.dart';

part 'pacientePlanoAlimentarViewModel.g.dart';

@JsonSerializable()
class PacientePlanoAlimentarViewModel {
  String? pacienteId;
  List<RefeicaoViewModel>? refeicoes;

  PacientePlanoAlimentarViewModel({this.pacienteId, this.refeicoes});

  static const fromJsonFactory = _$PacientePlanoAlimentarViewModelFromJson;

  Map<String, dynamic> toJson() =>
      _$PacientePlanoAlimentarViewModelToJson(this);
}

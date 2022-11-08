import 'package:json_annotation/json_annotation.dart';
import 'package:nutri/models/refeicao/refeicaoViewModel.dart';

part 'planoAlimentarViewModel.g.dart';

@JsonSerializable()
class PlanoAlimentarViewModel {
  String? id;
  String? data;
  List<RefeicaoViewModel>? refeicoes;

  PlanoAlimentarViewModel({this.id, this.data, this.refeicoes});

  static const fromJson = _$PlanoAlimentarViewModelFromJson;

  Map<String, dynamic> toJson() => _$PlanoAlimentarViewModelToJson(this);
}

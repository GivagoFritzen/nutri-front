import 'package:json_annotation/json_annotation.dart';

part 'nutricionistaDesvincularOuVincularViewModel.g.dart';

@JsonSerializable()
class NutricionistaDesvincularOuVincularViewModel {
  String? id;
  String? pacienteEmail;

  NutricionistaDesvincularOuVincularViewModel({this.id, this.pacienteEmail});

  static const fromJsonFactory =
      _$NutricionistaDesvincularOuVincularViewModelFromJson;

  Map<String, dynamic> toJson() =>
      _$NutricionistaDesvincularOuVincularViewModelToJson(this);
}

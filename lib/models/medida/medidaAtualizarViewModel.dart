import 'package:json_annotation/json_annotation.dart';
import 'package:nutri/models/medida/medidaViewModel.dart';

part 'medidaAtualizarViewModel.g.dart';

@JsonSerializable()
class MedidaAtualizarViewModel {
  String pacienteId;
  String medidaId;
  MedidaViewModel medida;

  MedidaAtualizarViewModel({
    required this.pacienteId,
    required this.medidaId,
    required this.medida,
  });

  static const fromJsonFactory = _$MedidaAtualizarViewModelFromJson;

  Map<String, dynamic> toJson() => _$MedidaAtualizarViewModelToJson(this);
}

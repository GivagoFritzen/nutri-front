import 'package:json_annotation/json_annotation.dart';
import 'package:nutri/models/medida/medidaViewModel.dart';

part 'medidaAdicionarViewModel.g.dart';

@JsonSerializable()
class MedidaAdicionarViewModel {
  String pacienteId;
  MedidaViewModel medida;

  MedidaAdicionarViewModel({
    required this.pacienteId,
    required this.medida,
  });

  static const fromJsonFactory = _$MedidaAdicionarViewModelFromJson;

  Map<String, dynamic> toJson() => _$MedidaAdicionarViewModelToJson(this);
}

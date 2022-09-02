import 'package:json_annotation/json_annotation.dart';
import 'package:nutri/models/circuferencia/circunferenciaViewModel.dart';

part 'medidaViewModel.g.dart';

@JsonSerializable()
class MedidaViewModel {
  String? id;
  String? descricao;
  String? data;
  double? pesoAtual;
  double? pesoIdeal;
  double? altura;
  CircunferenciaViewModel? circunferencia;

  MedidaViewModel(
      {this.id,
      this.descricao,
      this.data,
      this.pesoAtual,
      this.pesoIdeal,
      this.altura,
      this.circunferencia});

  static const fromJson = _$MedidaViewModelFromJson;

  Map<String, dynamic> toJson() => _$MedidaViewModelToJson(this);
}

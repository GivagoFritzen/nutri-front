import 'package:json_annotation/json_annotation.dart';
import 'package:nutri/enum/medidaCaseira.dart';

part 'alimentoViewModel.g.dart';

@JsonSerializable()
class AlimentoViewModel {
  String? nome;
  MedidaCaseira? medida;
  int? quantidade;

  AlimentoViewModel({this.nome, this.medida, this.quantidade});

  factory AlimentoViewModel.clone(AlimentoViewModel copy) {
    return AlimentoViewModel(
      nome: copy.nome,
      medida: copy.medida,
      quantidade: copy.quantidade,
    );
  }

  static const fromJson = _$AlimentoViewModelFromJson;

  Map<String, dynamic> toJson() => _$AlimentoViewModelToJson(this);
}

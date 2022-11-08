import 'package:json_annotation/json_annotation.dart';
import 'package:nutri/models/alimento/alimentoViewModel.dart';

part 'refeicaoViewModel.g.dart';

@JsonSerializable()
class RefeicaoViewModel {
  late DateTime? horario = DateTime.now();
  late String? descricao = "";
  late List<AlimentoViewModel>? alimentos = <AlimentoViewModel>[];

  RefeicaoViewModel(this.horario, this.alimentos, this.descricao);

  RefeicaoViewModel.empty();

  factory RefeicaoViewModel.clone(RefeicaoViewModel copy) {
    return RefeicaoViewModel(
      copy.horario,
      copy.alimentos,
      copy.descricao,
    );
  }

  static const fromJson = _$RefeicaoViewModelFromJson;

  Map<String, dynamic> toJson() => _$RefeicaoViewModelToJson(this);
}

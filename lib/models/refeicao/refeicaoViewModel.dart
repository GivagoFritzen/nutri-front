import 'package:nutri/models/alimento/alimentoViewModel.dart';

class RefeicaoViewModel {
  String? horario;
  String? descricao;
  List<AlimentoViewModel>? alimentos;

  RefeicaoViewModel({this.horario, this.descricao, this.alimentos});

  RefeicaoViewModel.fromJson(Map<String, dynamic> json) {
    horario = json['horario'];
    descricao = json['descricao'];
    if (json['alimentos'] != null) {
      alimentos = <AlimentoViewModel>[];
      json['alimentos'].forEach((v) {
        alimentos!.add(new AlimentoViewModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['horario'] = this.horario;
    data['descricao'] = this.descricao;
    if (this.alimentos != null) {
      data['alimentos'] = this.alimentos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

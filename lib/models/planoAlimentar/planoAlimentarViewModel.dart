import 'package:nutri/models/refeicao/refeicaoViewModel.dart';

class PlanoAlimentarViewModel {
  String? data;
  List<RefeicaoViewModel>? refeicoes;

  PlanoAlimentarViewModel({this.data, this.refeicoes});

  PlanoAlimentarViewModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    if (json['refeicoes'] != null) {
      refeicoes = <RefeicaoViewModel>[];
      json['refeicoes'].forEach((v) {
        refeicoes!.add(new RefeicaoViewModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    if (this.refeicoes != null) {
      data['refeicoes'] = this.refeicoes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

import 'package:nutri/models/circuferencia/circunferenciaViewModel.dart';

class MedidaViewModel {
  String? descricao;
  String? data;
  int? pesoAtual;
  int? pesoIdeal;
  int? altura;
  CircunferenciaViewModel? circunferencia;

  MedidaViewModel(
      {this.descricao,
      this.data,
      this.pesoAtual,
      this.pesoIdeal,
      this.altura,
      this.circunferencia});

  MedidaViewModel.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    data = json['data'];
    pesoAtual = json['pesoAtual'];
    pesoIdeal = json['pesoIdeal'];
    altura = json['altura'];
    circunferencia = json['circunferencia'] != null
        ? new CircunferenciaViewModel.fromJson(json['circunferencia'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['data'] = this.data;
    data['pesoAtual'] = this.pesoAtual;
    data['pesoIdeal'] = this.pesoIdeal;
    data['altura'] = this.altura;
    if (this.circunferencia != null) {
      data['circunferencia'] = this.circunferencia!.toJson();
    }
    return data;
  }
}

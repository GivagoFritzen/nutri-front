class AlimentoViewModel {
  String? nome;
  int? medida;
  int? quantidade;

  AlimentoViewModel({this.nome, this.medida, this.quantidade});

  AlimentoViewModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    medida = json['medida'];
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['medida'] = this.medida;
    data['quantidade'] = this.quantidade;
    return data;
  }
}

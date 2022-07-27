import 'package:json_annotation/json_annotation.dart';

part 'tacoPaginationViewModel.g.dart';

@JsonSerializable()
class TacoPaginationViewModel {
  List<Data>? data;
  int? total;

  TacoPaginationViewModel({this.data, this.total});

  static const fromJsonFactory = _$TacoPaginationViewModelFromJson;

  Map<String, dynamic> toJson() => _$TacoPaginationViewModelToJson(this);
}

class Data {
  Id? id;
  String? descricao;
  int? baseQuantidade;
  int? baseUnidade;
  int? categoria;
  Atributos? atributos;
  Humidade? vitaminaC;
  Humidade? re;
  Humidade? rae;

  Data(
      {this.id,
      this.descricao,
      this.baseQuantidade,
      this.baseUnidade,
      this.categoria,
      this.atributos,
      this.vitaminaC,
      this.re,
      this.rae});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? new Id.fromJson(json['id']) : null;
    descricao = json['descricao'];
    baseQuantidade = json['baseQuantidade'];
    baseUnidade = json['baseUnidade'];
    categoria = json['categoria'];
    atributos = json['atributos'] != null
        ? new Atributos.fromJson(json['atributos'])
        : null;
    vitaminaC = json['vitaminaC'] != null
        ? new Humidade.fromJson(json['vitaminaC'])
        : null;
    re = json['re'] != null ? new Humidade.fromJson(json['re']) : null;
    rae = json['rae'] != null ? new Humidade.fromJson(json['rae']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id!.toJson();
    }
    data['descricao'] = this.descricao;
    data['baseQuantidade'] = this.baseQuantidade;
    data['baseUnidade'] = this.baseUnidade;
    data['categoria'] = this.categoria;
    if (this.atributos != null) {
      data['atributos'] = this.atributos!.toJson();
    }
    if (this.vitaminaC != null) {
      data['vitaminaC'] = this.vitaminaC!.toJson();
    }
    if (this.re != null) {
      data['re'] = this.re!.toJson();
    }
    if (this.rae != null) {
      data['rae'] = this.rae!.toJson();
    }
    return data;
  }
}

class Id {
  int? timestamp;
  String? creationTime;

  Id({this.timestamp, this.creationTime});

  Id.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    creationTime = json['creationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['creationTime'] = this.creationTime;
    return data;
  }
}

class Atributos {
  Humidade? humidade;
  Humidade? proteina;
  Humidade? lipidio;
  Humidade? colesterol;
  Humidade? carboidrato;
  Humidade? fibra;
  Humidade? cinzas;
  Humidade? calcio;
  Humidade? magnesio;
  Humidade? fosforo;
  Humidade? ferro;
  Humidade? sodio;
  Humidade? potassio;
  Humidade? cobre;
  Humidade? zinco;
  Humidade? retinol;
  Humidade? tiamina;
  Humidade? riboflavina;
  Humidade? piridoxina;
  Humidade? niacina;
  Energia? energia;
  AcidosGraxos? acidosGraxos;
  Humidade? manganes;
  Aminoacidos? aminoacidos;

  Atributos(
      {this.humidade,
      this.proteina,
      this.lipidio,
      this.colesterol,
      this.carboidrato,
      this.fibra,
      this.cinzas,
      this.calcio,
      this.magnesio,
      this.fosforo,
      this.ferro,
      this.sodio,
      this.potassio,
      this.cobre,
      this.zinco,
      this.retinol,
      this.tiamina,
      this.riboflavina,
      this.piridoxina,
      this.niacina,
      this.energia,
      this.acidosGraxos,
      this.manganes,
      this.aminoacidos});

  Atributos.fromJson(Map<String, dynamic> json) {
    humidade = json['humidade'] != null
        ? new Humidade.fromJson(json['humidade'])
        : null;
    proteina = json['proteina'] != null
        ? new Humidade.fromJson(json['proteina'])
        : null;
    lipidio =
        json['lipidio'] != null ? new Humidade.fromJson(json['lipidio']) : null;
    colesterol = json['colesterol'] != null
        ? new Humidade.fromJson(json['colesterol'])
        : null;
    carboidrato = json['carboidrato'] != null
        ? new Humidade.fromJson(json['carboidrato'])
        : null;
    fibra = json['fibra'] != null ? new Humidade.fromJson(json['fibra']) : null;
    cinzas =
        json['cinzas'] != null ? new Humidade.fromJson(json['cinzas']) : null;
    calcio =
        json['calcio'] != null ? new Humidade.fromJson(json['calcio']) : null;
    magnesio = json['magnesio'] != null
        ? new Humidade.fromJson(json['magnesio'])
        : null;
    fosforo =
        json['fosforo'] != null ? new Humidade.fromJson(json['fosforo']) : null;
    ferro = json['ferro'] != null ? new Humidade.fromJson(json['ferro']) : null;
    sodio = json['sodio'] != null ? new Humidade.fromJson(json['sodio']) : null;
    potassio = json['potassio'] != null
        ? new Humidade.fromJson(json['potassio'])
        : null;
    cobre = json['cobre'] != null ? new Humidade.fromJson(json['cobre']) : null;
    zinco = json['zinco'] != null ? new Humidade.fromJson(json['zinco']) : null;
    retinol =
        json['retinol'] != null ? new Humidade.fromJson(json['retinol']) : null;
    tiamina =
        json['tiamina'] != null ? new Humidade.fromJson(json['tiamina']) : null;
    riboflavina = json['riboflavina'] != null
        ? new Humidade.fromJson(json['riboflavina'])
        : null;
    piridoxina = json['piridoxina'] != null
        ? new Humidade.fromJson(json['piridoxina'])
        : null;
    niacina =
        json['niacina'] != null ? new Humidade.fromJson(json['niacina']) : null;
    energia =
        json['energia'] != null ? new Energia.fromJson(json['energia']) : null;
    acidosGraxos = json['acidosGraxos'] != null
        ? new AcidosGraxos.fromJson(json['acidosGraxos'])
        : null;
    manganes = json['manganes'] != null
        ? new Humidade.fromJson(json['manganes'])
        : null;
    aminoacidos = json['aminoacidos'] != null
        ? new Aminoacidos.fromJson(json['aminoacidos'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.humidade != null) {
      data['humidade'] = this.humidade!.toJson();
    }
    if (this.proteina != null) {
      data['proteina'] = this.proteina!.toJson();
    }
    if (this.lipidio != null) {
      data['lipidio'] = this.lipidio!.toJson();
    }
    if (this.colesterol != null) {
      data['colesterol'] = this.colesterol!.toJson();
    }
    if (this.carboidrato != null) {
      data['carboidrato'] = this.carboidrato!.toJson();
    }
    if (this.fibra != null) {
      data['fibra'] = this.fibra!.toJson();
    }
    if (this.cinzas != null) {
      data['cinzas'] = this.cinzas!.toJson();
    }
    if (this.calcio != null) {
      data['calcio'] = this.calcio!.toJson();
    }
    if (this.magnesio != null) {
      data['magnesio'] = this.magnesio!.toJson();
    }
    if (this.fosforo != null) {
      data['fosforo'] = this.fosforo!.toJson();
    }
    if (this.ferro != null) {
      data['ferro'] = this.ferro!.toJson();
    }
    if (this.sodio != null) {
      data['sodio'] = this.sodio!.toJson();
    }
    if (this.potassio != null) {
      data['potassio'] = this.potassio!.toJson();
    }
    if (this.cobre != null) {
      data['cobre'] = this.cobre!.toJson();
    }
    if (this.zinco != null) {
      data['zinco'] = this.zinco!.toJson();
    }
    if (this.retinol != null) {
      data['retinol'] = this.retinol!.toJson();
    }
    if (this.tiamina != null) {
      data['tiamina'] = this.tiamina!.toJson();
    }
    if (this.riboflavina != null) {
      data['riboflavina'] = this.riboflavina!.toJson();
    }
    if (this.piridoxina != null) {
      data['piridoxina'] = this.piridoxina!.toJson();
    }
    if (this.niacina != null) {
      data['niacina'] = this.niacina!.toJson();
    }
    if (this.energia != null) {
      data['energia'] = this.energia!.toJson();
    }
    if (this.acidosGraxos != null) {
      data['acidosGraxos'] = this.acidosGraxos!.toJson();
    }
    if (this.manganes != null) {
      data['manganes'] = this.manganes!.toJson();
    }
    if (this.aminoacidos != null) {
      data['aminoacidos'] = this.aminoacidos!.toJson();
    }
    return data;
  }
}

class Humidade {
  String? quantidade;
  int? medida;

  Humidade({this.quantidade, this.medida});

  Humidade.fromJson(Map<String, dynamic> json) {
    quantidade = json['quantidade'];
    medida = json['medida'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantidade'] = this.quantidade;
    data['medida'] = this.medida;
    return data;
  }
}

class Energia {
  String? quilocaloria;
  String? quilojoule;

  Energia({this.quilocaloria, this.quilojoule});

  Energia.fromJson(Map<String, dynamic> json) {
    quilocaloria = json['quilocaloria'];
    quilojoule = json['quilojoule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quilocaloria'] = this.quilocaloria;
    data['quilojoule'] = this.quilojoule;
    return data;
  }
}

class AcidosGraxos {
  Humidade? saturado;
  Humidade? monoinsaturado;
  Humidade? poliinsaturado;

  AcidosGraxos({this.saturado, this.monoinsaturado, this.poliinsaturado});

  AcidosGraxos.fromJson(Map<String, dynamic> json) {
    saturado = json['saturado'] != null
        ? new Humidade.fromJson(json['saturado'])
        : null;
    monoinsaturado = json['monoinsaturado'] != null
        ? new Humidade.fromJson(json['monoinsaturado'])
        : null;
    poliinsaturado = json['poliinsaturado'] != null
        ? new Humidade.fromJson(json['poliinsaturado'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.saturado != null) {
      data['saturado'] = this.saturado!.toJson();
    }
    if (this.monoinsaturado != null) {
      data['monoinsaturado'] = this.monoinsaturado!.toJson();
    }
    if (this.poliinsaturado != null) {
      data['poliinsaturado'] = this.poliinsaturado!.toJson();
    }
    return data;
  }
}

class Aminoacidos {
  Humidade? triptofano;
  Humidade? treonina;
  Humidade? isoleucina;
  Humidade? leucina;
  Humidade? lisina;
  Humidade? metionina;
  Humidade? cistina;
  Humidade? fenilalanina;
  Humidade? tirosina;
  Humidade? valina;
  Humidade? arginina;
  Humidade? histidina;
  Humidade? alanina;
  Humidade? aspartico;
  Humidade? glutamico;
  Humidade? glicina;
  Humidade? prolina;
  Humidade? serina;

  Aminoacidos(
      {this.triptofano,
      this.treonina,
      this.isoleucina,
      this.leucina,
      this.lisina,
      this.metionina,
      this.cistina,
      this.fenilalanina,
      this.tirosina,
      this.valina,
      this.arginina,
      this.histidina,
      this.alanina,
      this.aspartico,
      this.glutamico,
      this.glicina,
      this.prolina,
      this.serina});

  Aminoacidos.fromJson(Map<String, dynamic> json) {
    triptofano = json['triptofano'] != null
        ? new Humidade.fromJson(json['triptofano'])
        : null;
    treonina = json['treonina'] != null
        ? new Humidade.fromJson(json['treonina'])
        : null;
    isoleucina = json['isoleucina'] != null
        ? new Humidade.fromJson(json['isoleucina'])
        : null;
    leucina =
        json['leucina'] != null ? new Humidade.fromJson(json['leucina']) : null;
    lisina =
        json['lisina'] != null ? new Humidade.fromJson(json['lisina']) : null;
    metionina = json['metionina'] != null
        ? new Humidade.fromJson(json['metionina'])
        : null;
    cistina =
        json['cistina'] != null ? new Humidade.fromJson(json['cistina']) : null;
    fenilalanina = json['fenilalanina'] != null
        ? new Humidade.fromJson(json['fenilalanina'])
        : null;
    tirosina = json['tirosina'] != null
        ? new Humidade.fromJson(json['tirosina'])
        : null;
    valina =
        json['valina'] != null ? new Humidade.fromJson(json['valina']) : null;
    arginina = json['arginina'] != null
        ? new Humidade.fromJson(json['arginina'])
        : null;
    histidina = json['histidina'] != null
        ? new Humidade.fromJson(json['histidina'])
        : null;
    alanina =
        json['alanina'] != null ? new Humidade.fromJson(json['alanina']) : null;
    aspartico = json['aspartico'] != null
        ? new Humidade.fromJson(json['aspartico'])
        : null;
    glutamico = json['glutamico'] != null
        ? new Humidade.fromJson(json['glutamico'])
        : null;
    glicina =
        json['glicina'] != null ? new Humidade.fromJson(json['glicina']) : null;
    prolina =
        json['prolina'] != null ? new Humidade.fromJson(json['prolina']) : null;
    serina =
        json['serina'] != null ? new Humidade.fromJson(json['serina']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.triptofano != null) {
      data['triptofano'] = this.triptofano!.toJson();
    }
    if (this.treonina != null) {
      data['treonina'] = this.treonina!.toJson();
    }
    if (this.isoleucina != null) {
      data['isoleucina'] = this.isoleucina!.toJson();
    }
    if (this.leucina != null) {
      data['leucina'] = this.leucina!.toJson();
    }
    if (this.lisina != null) {
      data['lisina'] = this.lisina!.toJson();
    }
    if (this.metionina != null) {
      data['metionina'] = this.metionina!.toJson();
    }
    if (this.cistina != null) {
      data['cistina'] = this.cistina!.toJson();
    }
    if (this.fenilalanina != null) {
      data['fenilalanina'] = this.fenilalanina!.toJson();
    }
    if (this.tirosina != null) {
      data['tirosina'] = this.tirosina!.toJson();
    }
    if (this.valina != null) {
      data['valina'] = this.valina!.toJson();
    }
    if (this.arginina != null) {
      data['arginina'] = this.arginina!.toJson();
    }
    if (this.histidina != null) {
      data['histidina'] = this.histidina!.toJson();
    }
    if (this.alanina != null) {
      data['alanina'] = this.alanina!.toJson();
    }
    if (this.aspartico != null) {
      data['aspartico'] = this.aspartico!.toJson();
    }
    if (this.glutamico != null) {
      data['glutamico'] = this.glutamico!.toJson();
    }
    if (this.glicina != null) {
      data['glicina'] = this.glicina!.toJson();
    }
    if (this.prolina != null) {
      data['prolina'] = this.prolina!.toJson();
    }
    if (this.serina != null) {
      data['serina'] = this.serina!.toJson();
    }
    return data;
  }
}

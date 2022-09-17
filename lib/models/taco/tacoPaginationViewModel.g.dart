// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tacoPaginationViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TacoPaginationViewModel _$TacoPaginationViewModelFromJson(
        Map<String, dynamic> json) =>
    TacoPaginationViewModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$TacoPaginationViewModelToJson(
        TacoPaginationViewModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      descricao: json['descricao'] as String,
      baseQuantidade: json['baseQuantidade'] as int?,
      baseUnidade: json['baseUnidade'] as int?,
      categoria: json['categoria'] as int?,
      atributos: json['atributos'] == null
          ? null
          : Atributos.fromJson(json['atributos'] as Map<String, dynamic>),
      vitaminaC: json['vitaminaC'] == null
          ? null
          : Humidade.fromJson(json['vitaminaC'] as Map<String, dynamic>),
      re: json['re'] == null
          ? null
          : Humidade.fromJson(json['re'] as Map<String, dynamic>),
      rae: json['rae'] == null
          ? null
          : Humidade.fromJson(json['rae'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
      'baseQuantidade': instance.baseQuantidade,
      'baseUnidade': instance.baseUnidade,
      'categoria': instance.categoria,
      'atributos': instance.atributos,
      'vitaminaC': instance.vitaminaC,
      're': instance.re,
      'rae': instance.rae,
    };

Atributos _$AtributosFromJson(Map<String, dynamic> json) => Atributos(
      humidade: json['humidade'] == null
          ? null
          : Humidade.fromJson(json['humidade'] as Map<String, dynamic>),
      proteina: json['proteina'] == null
          ? null
          : Humidade.fromJson(json['proteina'] as Map<String, dynamic>),
      lipidio: json['lipidio'] == null
          ? null
          : Humidade.fromJson(json['lipidio'] as Map<String, dynamic>),
      colesterol: json['colesterol'] == null
          ? null
          : Humidade.fromJson(json['colesterol'] as Map<String, dynamic>),
      carboidrato: json['carboidrato'] == null
          ? null
          : Humidade.fromJson(json['carboidrato'] as Map<String, dynamic>),
      fibra: json['fibra'] == null
          ? null
          : Humidade.fromJson(json['fibra'] as Map<String, dynamic>),
      cinzas: json['cinzas'] == null
          ? null
          : Humidade.fromJson(json['cinzas'] as Map<String, dynamic>),
      calcio: json['calcio'] == null
          ? null
          : Humidade.fromJson(json['calcio'] as Map<String, dynamic>),
      magnesio: json['magnesio'] == null
          ? null
          : Humidade.fromJson(json['magnesio'] as Map<String, dynamic>),
      fosforo: json['fosforo'] == null
          ? null
          : Humidade.fromJson(json['fosforo'] as Map<String, dynamic>),
      ferro: json['ferro'] == null
          ? null
          : Humidade.fromJson(json['ferro'] as Map<String, dynamic>),
      sodio: json['sodio'] == null
          ? null
          : Humidade.fromJson(json['sodio'] as Map<String, dynamic>),
      potassio: json['potassio'] == null
          ? null
          : Humidade.fromJson(json['potassio'] as Map<String, dynamic>),
      cobre: json['cobre'] == null
          ? null
          : Humidade.fromJson(json['cobre'] as Map<String, dynamic>),
      zinco: json['zinco'] == null
          ? null
          : Humidade.fromJson(json['zinco'] as Map<String, dynamic>),
      retinol: json['retinol'] == null
          ? null
          : Humidade.fromJson(json['retinol'] as Map<String, dynamic>),
      tiamina: json['tiamina'] == null
          ? null
          : Humidade.fromJson(json['tiamina'] as Map<String, dynamic>),
      riboflavina: json['riboflavina'] == null
          ? null
          : Humidade.fromJson(json['riboflavina'] as Map<String, dynamic>),
      piridoxina: json['piridoxina'] == null
          ? null
          : Humidade.fromJson(json['piridoxina'] as Map<String, dynamic>),
      niacina: json['niacina'] == null
          ? null
          : Humidade.fromJson(json['niacina'] as Map<String, dynamic>),
      energia: json['energia'] == null
          ? null
          : Energia.fromJson(json['energia'] as Map<String, dynamic>),
      acidosGraxos: json['acidosGraxos'] == null
          ? null
          : AcidosGraxos.fromJson(json['acidosGraxos'] as Map<String, dynamic>),
      manganes: json['manganes'] == null
          ? null
          : Humidade.fromJson(json['manganes'] as Map<String, dynamic>),
      aminoacidos: json['aminoacidos'] == null
          ? null
          : Aminoacidos.fromJson(json['aminoacidos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AtributosToJson(Atributos instance) => <String, dynamic>{
      'humidade': instance.humidade,
      'proteina': instance.proteina,
      'lipidio': instance.lipidio,
      'colesterol': instance.colesterol,
      'carboidrato': instance.carboidrato,
      'fibra': instance.fibra,
      'cinzas': instance.cinzas,
      'calcio': instance.calcio,
      'magnesio': instance.magnesio,
      'fosforo': instance.fosforo,
      'ferro': instance.ferro,
      'sodio': instance.sodio,
      'potassio': instance.potassio,
      'cobre': instance.cobre,
      'zinco': instance.zinco,
      'retinol': instance.retinol,
      'tiamina': instance.tiamina,
      'riboflavina': instance.riboflavina,
      'piridoxina': instance.piridoxina,
      'niacina': instance.niacina,
      'energia': instance.energia,
      'acidosGraxos': instance.acidosGraxos,
      'manganes': instance.manganes,
      'aminoacidos': instance.aminoacidos,
    };

Humidade _$HumidadeFromJson(Map<String, dynamic> json) => Humidade(
      quantidade: json['quantidade'],
      medida: json['medida'] as int?,
    );

Map<String, dynamic> _$HumidadeToJson(Humidade instance) => <String, dynamic>{
      'quantidade': instance.quantidade,
      'medida': instance.medida,
    };

Energia _$EnergiaFromJson(Map<String, dynamic> json) => Energia(
      quilocaloria: json['quilocaloria'],
      quilojoule: json['quilojoule'],
    );

Map<String, dynamic> _$EnergiaToJson(Energia instance) => <String, dynamic>{
      'quilocaloria': instance.quilocaloria,
      'quilojoule': instance.quilojoule,
    };

AcidosGraxos _$AcidosGraxosFromJson(Map<String, dynamic> json) => AcidosGraxos(
      saturado: json['saturado'] == null
          ? null
          : Humidade.fromJson(json['saturado'] as Map<String, dynamic>),
      monoinsaturado: json['monoinsaturado'] == null
          ? null
          : Humidade.fromJson(json['monoinsaturado'] as Map<String, dynamic>),
      poliinsaturado: json['poliinsaturado'] == null
          ? null
          : Humidade.fromJson(json['poliinsaturado'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcidosGraxosToJson(AcidosGraxos instance) =>
    <String, dynamic>{
      'saturado': instance.saturado,
      'monoinsaturado': instance.monoinsaturado,
      'poliinsaturado': instance.poliinsaturado,
    };

Aminoacidos _$AminoacidosFromJson(Map<String, dynamic> json) => Aminoacidos(
      triptofano: json['triptofano'] == null
          ? null
          : Humidade.fromJson(json['triptofano'] as Map<String, dynamic>),
      treonina: json['treonina'] == null
          ? null
          : Humidade.fromJson(json['treonina'] as Map<String, dynamic>),
      isoleucina: json['isoleucina'] == null
          ? null
          : Humidade.fromJson(json['isoleucina'] as Map<String, dynamic>),
      leucina: json['leucina'] == null
          ? null
          : Humidade.fromJson(json['leucina'] as Map<String, dynamic>),
      lisina: json['lisina'] == null
          ? null
          : Humidade.fromJson(json['lisina'] as Map<String, dynamic>),
      metionina: json['metionina'] == null
          ? null
          : Humidade.fromJson(json['metionina'] as Map<String, dynamic>),
      cistina: json['cistina'] == null
          ? null
          : Humidade.fromJson(json['cistina'] as Map<String, dynamic>),
      fenilalanina: json['fenilalanina'] == null
          ? null
          : Humidade.fromJson(json['fenilalanina'] as Map<String, dynamic>),
      tirosina: json['tirosina'] == null
          ? null
          : Humidade.fromJson(json['tirosina'] as Map<String, dynamic>),
      valina: json['valina'] == null
          ? null
          : Humidade.fromJson(json['valina'] as Map<String, dynamic>),
      arginina: json['arginina'] == null
          ? null
          : Humidade.fromJson(json['arginina'] as Map<String, dynamic>),
      histidina: json['histidina'] == null
          ? null
          : Humidade.fromJson(json['histidina'] as Map<String, dynamic>),
      alanina: json['alanina'] == null
          ? null
          : Humidade.fromJson(json['alanina'] as Map<String, dynamic>),
      aspartico: json['aspartico'] == null
          ? null
          : Humidade.fromJson(json['aspartico'] as Map<String, dynamic>),
      glutamico: json['glutamico'] == null
          ? null
          : Humidade.fromJson(json['glutamico'] as Map<String, dynamic>),
      glicina: json['glicina'] == null
          ? null
          : Humidade.fromJson(json['glicina'] as Map<String, dynamic>),
      prolina: json['prolina'] == null
          ? null
          : Humidade.fromJson(json['prolina'] as Map<String, dynamic>),
      serina: json['serina'] == null
          ? null
          : Humidade.fromJson(json['serina'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AminoacidosToJson(Aminoacidos instance) =>
    <String, dynamic>{
      'triptofano': instance.triptofano,
      'treonina': instance.treonina,
      'isoleucina': instance.isoleucina,
      'leucina': instance.leucina,
      'lisina': instance.lisina,
      'metionina': instance.metionina,
      'cistina': instance.cistina,
      'fenilalanina': instance.fenilalanina,
      'tirosina': instance.tirosina,
      'valina': instance.valina,
      'arginina': instance.arginina,
      'histidina': instance.histidina,
      'alanina': instance.alanina,
      'aspartico': instance.aspartico,
      'glutamico': instance.glutamico,
      'glicina': instance.glicina,
      'prolina': instance.prolina,
      'serina': instance.serina,
    };

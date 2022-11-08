// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alimentoViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlimentoViewModel _$AlimentoViewModelFromJson(Map<String, dynamic> json) =>
    AlimentoViewModel(
      nome: json['nome'] as String?,
      medida: $enumDecodeNullable(_$MedidaCaseiraEnumMap, json['medida']),
      quantidade: json['quantidade'] as int?,
    );

Map<String, dynamic> _$AlimentoViewModelToJson(AlimentoViewModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'medida': _$MedidaCaseiraEnumMap[instance.medida],
      'quantidade': instance.quantidade,
    };

const _$MedidaCaseiraEnumMap = {
  MedidaCaseira.Grama: 0,
  MedidaCaseira.MeiaXicara: 1,
  MedidaCaseira.ColherArrozCheia: 2,
  MedidaCaseira.ColherArrozRasa: 3,
  MedidaCaseira.ColherSopaCheia: 4,
  MedidaCaseira.ColhersopaRasa: 5,
  MedidaCaseira.Colher: 6,
};

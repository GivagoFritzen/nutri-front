// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medidaViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedidaViewModel _$MedidaViewModelFromJson(Map<String, dynamic> json) =>
    MedidaViewModel(
      id: json['id'] as String?,
      descricao: json['descricao'] as String?,
      data: json['data'] as String?,
      pesoAtual: (json['pesoAtual'] as num?)?.toDouble(),
      pesoIdeal: (json['pesoIdeal'] as num?)?.toDouble(),
      altura: (json['altura'] as num?)?.toDouble(),
      circunferencia: json['circunferencia'] == null
          ? null
          : CircunferenciaViewModel.fromJson(
              json['circunferencia'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MedidaViewModelToJson(MedidaViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
      'data': instance.data,
      'pesoAtual': instance.pesoAtual,
      'pesoIdeal': instance.pesoIdeal,
      'altura': instance.altura,
      'circunferencia': instance.circunferencia,
    };

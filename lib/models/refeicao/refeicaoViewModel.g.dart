// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refeicaoViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefeicaoViewModel _$RefeicaoViewModelFromJson(Map<String, dynamic> json) =>
    RefeicaoViewModel(
      json['horario'] == null
          ? null
          : DateTime.parse(json['horario'] as String),
      (json['alimentos'] as List<dynamic>?)
          ?.map((e) => AlimentoViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['descricao'] as String?,
    );

Map<String, dynamic> _$RefeicaoViewModelToJson(RefeicaoViewModel instance) =>
    <String, dynamic>{
      'horario': instance.horario?.toIso8601String(),
      'descricao': instance.descricao,
      'alimentos': instance.alimentos,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planoAlimentarViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanoAlimentarViewModel _$PlanoAlimentarViewModelFromJson(
        Map<String, dynamic> json) =>
    PlanoAlimentarViewModel(
      id: json['id'] as String?,
      data: json['data'] as String?,
      refeicoes: (json['refeicoes'] as List<dynamic>?)
          ?.map((e) => RefeicaoViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanoAlimentarViewModelToJson(
        PlanoAlimentarViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
      'refeicoes': instance.refeicoes,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacientePlanoAlimentarViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacientePlanoAlimentarViewModel _$PacientePlanoAlimentarViewModelFromJson(
        Map<String, dynamic> json) =>
    PacientePlanoAlimentarViewModel(
      pacienteId: json['pacienteId'] as String?,
      refeicoes: (json['refeicoes'] as List<dynamic>?)
          ?.map((e) => RefeicaoViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PacientePlanoAlimentarViewModelToJson(
        PacientePlanoAlimentarViewModel instance) =>
    <String, dynamic>{
      'pacienteId': instance.pacienteId,
      'refeicoes': instance.refeicoes,
    };

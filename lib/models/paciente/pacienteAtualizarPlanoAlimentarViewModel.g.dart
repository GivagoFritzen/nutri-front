// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacienteAtualizarPlanoAlimentarViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteAtualizarPlanoAlimentarViewModel
    _$PacienteAtualizarPlanoAlimentarViewModelFromJson(
            Map<String, dynamic> json) =>
        PacienteAtualizarPlanoAlimentarViewModel(
          planoAlimentarId: json['planoAlimentarId'] as String?,
          planoAlimentar: json['planoAlimentar'] == null
              ? null
              : PlanoAlimentarViewModel.fromJson(
                  json['planoAlimentar'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PacienteAtualizarPlanoAlimentarViewModelToJson(
        PacienteAtualizarPlanoAlimentarViewModel instance) =>
    <String, dynamic>{
      'planoAlimentarId': instance.planoAlimentarId,
      'planoAlimentar': instance.planoAlimentar,
    };

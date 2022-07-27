// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacienteAtualizarViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteAtualizarViewModel _$PacienteAtualizarViewModelFromJson(
        Map<String, dynamic> json) =>
    PacienteAtualizarViewModel(
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      email: json['email'] as String,
      cidade: json['cidade'] as String,
      telefone: json['telefone'] as String,
      sexo: json['sexo'] as bool,
      id: json['id'] as String,
    );

Map<String, dynamic> _$PacienteAtualizarViewModelToJson(
        PacienteAtualizarViewModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'cidade': instance.cidade,
      'telefone': instance.telefone,
      'sexo': instance.sexo,
      'id': instance.id,
    };

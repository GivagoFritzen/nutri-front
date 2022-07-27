// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacienteAdicionarViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteAdicionarViewModel _$PacienteAdicionarViewModelFromJson(
        Map<String, dynamic> json) =>
    PacienteAdicionarViewModel(
      nome: json['nome'] as String?,
      sobrenome: json['sobrenome'] as String?,
      email: json['email'] as String?,
      cidade: json['cidade'] as String?,
      telefone: json['telefone'] as String?,
      sexo: json['sexo'] as bool?,
    );

Map<String, dynamic> _$PacienteAdicionarViewModelToJson(
        PacienteAdicionarViewModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'cidade': instance.cidade,
      'telefone': instance.telefone,
      'sexo': instance.sexo,
    };

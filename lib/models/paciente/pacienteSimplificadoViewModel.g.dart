// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacienteSimplificadoViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteSimplificadoViewModel _$PacienteSimplificadoViewModelFromJson(
        Map<String, dynamic> json) =>
    PacienteSimplificadoViewModel()
      ..id = json['id'] as String?
      ..nome = json['nome'] as String?
      ..sobrenome = json['sobrenome'] as String?
      ..email = json['email'] as String?
      ..telefone = json['telefone'] as String?;

Map<String, dynamic> _$PacienteSimplificadoViewModelToJson(
        PacienteSimplificadoViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'telefone': instance.telefone,
    };

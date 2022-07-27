// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacienteViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacienteViewModel _$PacienteViewModelFromJson(Map<String, dynamic> json) =>
    PacienteViewModel(
      id: json['id'] as String?,
      nome: json['nome'] as String?,
      sobrenome: json['sobrenome'] as String?,
      email: json['email'] as String?,
      cidade: json['cidade'] as String?,
      telefone: json['telefone'] as String?,
      sexo: json['sexo'] as bool?,
      medidas: (json['medidas'] as List<dynamic>?)
          ?.map((e) => MedidaViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      planoAlimentares: (json['planoAlimentares'] as List<dynamic>?)
          ?.map((e) =>
              PlanoAlimentarViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PacienteViewModelToJson(PacienteViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'cidade': instance.cidade,
      'telefone': instance.telefone,
      'sexo': instance.sexo,
      'medidas': instance.medidas,
      'planoAlimentares': instance.planoAlimentares,
    };

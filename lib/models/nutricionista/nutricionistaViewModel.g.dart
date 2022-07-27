// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutricionistaViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutricionistaViewModel _$NutricionistaViewModelFromJson(
        Map<String, dynamic> json) =>
    NutricionistaViewModel(
      nome: json['nome'] as String?,
      sobrenome: json['sobrenome'] as String?,
      email: json['email'] as String?,
      cidade: json['cidade'] as String?,
      telefone: json['telefone'] as String?,
      sexo: json['sexo'] as bool?,
      pacientesIds: (json['pacientesIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NutricionistaViewModelToJson(
        NutricionistaViewModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'cidade': instance.cidade,
      'telefone': instance.telefone,
      'sexo': instance.sexo,
      'pacientesIds': instance.pacientesIds,
    };

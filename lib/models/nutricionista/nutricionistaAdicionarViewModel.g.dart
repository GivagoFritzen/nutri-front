// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutricionistaAdicionarViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutricionistaAdicionarViewModel _$NutricionistaAdicionarViewModelFromJson(
        Map<String, dynamic> json) =>
    NutricionistaAdicionarViewModel(
      senha: json['senha'] as String?,
      nome: json['nome'] as String?,
      sobrenome: json['sobrenome'] as String?,
      email: json['email'] as String?,
      cidade: json['cidade'] as String?,
      telefone: json['telefone'] as String?,
      sexo: json['sexo'] as bool?,
    );

Map<String, dynamic> _$NutricionistaAdicionarViewModelToJson(
        NutricionistaAdicionarViewModel instance) =>
    <String, dynamic>{
      'senha': instance.senha,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'cidade': instance.cidade,
      'telefone': instance.telefone,
      'sexo': instance.sexo,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutricionistaAtualizarViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutricionistaAtualizarViewModel _$NutricionistaAtualizarViewModelFromJson(
        Map<String, dynamic> json) =>
    NutricionistaAtualizarViewModel(
      id: json['id'] as String?,
      nome: json['nome'] as String?,
      sobrenome: json['sobrenome'] as String?,
      email: json['email'] as String?,
      cidade: json['cidade'] as String?,
      telefone: json['telefone'] as String?,
      sexo: json['sexo'] as bool?,
      antigaSenha: json['antigaSenha'] as String?,
      novaSenha: json['novaSenha'] as String?,
    );

Map<String, dynamic> _$NutricionistaAtualizarViewModelToJson(
        NutricionistaAtualizarViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'cidade': instance.cidade,
      'telefone': instance.telefone,
      'sexo': instance.sexo,
      'antigaSenha': instance.antigaSenha,
      'novaSenha': instance.novaSenha,
    };

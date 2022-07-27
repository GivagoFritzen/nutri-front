// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medidaAtualizarViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedidaAtualizarViewModel _$MedidaAtualizarViewModelFromJson(
        Map<String, dynamic> json) =>
    MedidaAtualizarViewModel(
      pacienteId: json['pacienteId'] as String,
      medidaId: json['medidaId'] as String,
      medida: MedidaViewModel.fromJson(json['medida'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MedidaAtualizarViewModelToJson(
        MedidaAtualizarViewModel instance) =>
    <String, dynamic>{
      'pacienteId': instance.pacienteId,
      'medidaId': instance.medidaId,
      'medida': instance.medida,
    };

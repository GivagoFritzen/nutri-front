// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medidaAdicionarViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedidaAdicionarViewModel _$MedidaAdicionarViewModelFromJson(
        Map<String, dynamic> json) =>
    MedidaAdicionarViewModel(
      pacienteId: json['pacienteId'] as String,
      medida: MedidaViewModel.fromJson(json['medida'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MedidaAdicionarViewModelToJson(
        MedidaAdicionarViewModel instance) =>
    <String, dynamic>{
      'pacienteId': instance.pacienteId,
      'medida': instance.medida,
    };

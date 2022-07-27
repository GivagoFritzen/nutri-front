// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tacoPaginationViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TacoPaginationViewModel _$TacoPaginationViewModelFromJson(
        Map<String, dynamic> json) =>
    TacoPaginationViewModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$TacoPaginationViewModelToJson(
        TacoPaginationViewModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

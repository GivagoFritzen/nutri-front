// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errorViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorViewModel _$ErrorViewModelFromJson(Map<String, dynamic> json) =>
    ErrorViewModel(
      error: json['error'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ErrorViewModelToJson(ErrorViewModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'errors': instance.errors,
    };

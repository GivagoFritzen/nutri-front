// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginTokenViewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginTokenViewModel _$LoginTokenViewModelFromJson(Map<String, dynamic> json) =>
    LoginTokenViewModel(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$LoginTokenViewModelToJson(
        LoginTokenViewModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

import 'package:json_annotation/json_annotation.dart';

part 'errorViewModel.g.dart';

@JsonSerializable()
class ErrorViewModel {
  final String? error;
  final dynamic? errors;

  ErrorViewModel({
    this.error,
    this.errors,
  });

  static const fromJsonFactory = _$ErrorViewModelFromJson;

  Map<String, dynamic> toJson() => _$ErrorViewModelToJson(this);
}

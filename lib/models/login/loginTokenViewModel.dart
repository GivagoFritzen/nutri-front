import 'package:json_annotation/json_annotation.dart';

part 'loginTokenViewModel.g.dart';

@JsonSerializable()
class LoginTokenViewModel {
  final String token;
  final String refreshToken;

  LoginTokenViewModel({
    required this.token,
    required this.refreshToken,
  });

  static const fromJsonFactory = _$LoginTokenViewModelFromJson;

  Map<String, dynamic> toJson() => _$LoginTokenViewModelToJson(this);
}

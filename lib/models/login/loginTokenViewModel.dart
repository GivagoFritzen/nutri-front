import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginTokenViewModel {
  final String Token, RefreshToken;

  LoginTokenViewModel({required this.Token, required this.RefreshToken});
}

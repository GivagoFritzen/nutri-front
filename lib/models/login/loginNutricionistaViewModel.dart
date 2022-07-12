import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginNutricionistaViewModel {
  final String Email, Senha;

  LoginNutricionistaViewModel({
    required this.Email,
    required this.Senha,
  });
}

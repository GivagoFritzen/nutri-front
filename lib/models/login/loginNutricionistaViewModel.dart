import 'dart:convert';

LoginNutricionistaViewModel loginNutricionistaViewModelFromJson(String str) =>
    LoginNutricionistaViewModel.fromJson(json.decode(str));

String loginNutricionistaViewModelToJson(LoginNutricionistaViewModel data) =>
    json.encode(data.toJson());

class LoginNutricionistaViewModel {
  LoginNutricionistaViewModel({
    required this.email,
    required this.senha,
  });

  String email;
  String senha;

  factory LoginNutricionistaViewModel.fromJson(Map<String, dynamic> json) =>
      LoginNutricionistaViewModel(
        email: json["email"],
        senha: json["senha"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "senha": senha,
      };
}

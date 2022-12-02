import 'package:flutter/material.dart';
import 'package:nutri/models/login/loginTokenViewModel.dart';
import 'package:nutri/services/erroService.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/services/loginService.dart';

class RefreshTokenService {
  static Future<void> refresh(
    BuildContext context,
    LocalStorageService localStorageService,
    LoginService loginService,
    LoginTokenViewModel viewModel,
  ) async {
    var response = await loginService.refreshToken(viewModel);

    if (!ErrorService.alertErrors(context, response.error)) {
      localStorageService.setString('token', response.body!.token);
      localStorageService.setString(
          'refreshToken', response.body!.refreshToken);
      localStorageService.readLocale();

      Navigator.pushNamed(context, ModalRoute.of(context)!.settings.name!);
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }
}

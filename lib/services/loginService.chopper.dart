// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$LoginService extends LoginService {
  _$LoginService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LoginService;

  @override
  Future<Response<LoginTokenViewModel>> login(
      LoginNutricionistaViewModel login) {
    final $url = 'Login';
    final $body = login;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginTokenViewModel, LoginTokenViewModel>($request);
  }

  @override
  Future<Response<LoginTokenViewModel>> refreshToken(
      LoginTokenViewModel loginToken) {
    final $url = 'Login';
    final $body = loginToken;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<LoginTokenViewModel, LoginTokenViewModel>($request);
  }
}

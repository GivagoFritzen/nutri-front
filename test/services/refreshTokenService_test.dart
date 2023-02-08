import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nutri/models/erros/errorViewModel.dart';
import 'package:nutri/models/login/loginTokenViewModel.dart';
import 'package:nutri/pages/loginPage.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/services/loginService.dart';
import 'package:nutri/services/refreshTokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String tokenMock = 'token';
String refreshTokenMock = 'refreshToken';
ErrorViewModel? erroMock;

class LoginServiceTest extends Mock implements LoginService {
  @override
  Future<Response<LoginTokenViewModel>> refreshToken(
      @Body() LoginTokenViewModel loginToken) {
    var model =
        LoginTokenViewModel(token: tokenMock, refreshToken: refreshTokenMock);

    var base = http.Response(model.toJson().toString(), 200);
    var response = Response(base, model);
    var future = Future.value(response);
    return future;
  }
}

class LoginServiceInvalidTest extends Mock implements LoginService {
  @override
  Future<Response<LoginTokenViewModel>> refreshToken(
      @Body() LoginTokenViewModel loginToken) {
    var model =
        LoginTokenViewModel(token: tokenMock, refreshToken: refreshTokenMock);
    var base = http.Response(model.toJson().toString(), 400);
    var response = Response(base, model, error: jsonEncode(erroMock));
    var future = Future.value(response);
    return future;
  }
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {
  Route<dynamic>? lastRoute;

  Route<dynamic>? getLastRoute() {
    return lastRoute;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    lastRoute = route;
  }
}

@GenerateMocks([LoginServiceTest])
Future<void> main() async {
  LoginServiceTest? loginService;
  LoginServiceInvalidTest? loginServiceInvalid;
  MockNavigatorObserver? mockObserver;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    mockObserver = MockNavigatorObserver();
  });

  setUpAll(() {
    loginService = LoginServiceTest();
    loginServiceInvalid = LoginServiceInvalidTest();
  });

  testWidgets('Refresh Token Valid', (WidgetTester tester) async {
    await SharedPreferences.getInstance();
    await tester.pumpWidget(
      MaterialApp(
        home: const Material(child: Scaffold()),
        navigatorObservers: [mockObserver!],
      ),
    );

    final BuildContext context = tester.element(find.byType(Scaffold));
    var localStorageService = LocalStorageService();

    await RefreshTokenService.refresh(
        context,
        localStorageService,
        loginService!,
        LoginTokenViewModel(token: tokenMock, refreshToken: refreshTokenMock));

    expect(localStorageService.local["token"]!, tokenMock);
    expect(localStorageService.local["refreshToken"]!, refreshTokenMock);
  });

  testWidgets('Refresh Token Invalid', (WidgetTester tester) async {
    await SharedPreferences.getInstance();
    await tester.pumpWidget(
      MaterialApp(
        home: const Material(child: Scaffold()),
        routes: {'/login': (context) => const LoginPage()},
        navigatorObservers: [mockObserver!],
      ),
    );

    final BuildContext context = tester.element(find.byType(Scaffold));
    var localStorageService = LocalStorageService();
    erroMock = ErrorViewModel(error: "erro");

    await RefreshTokenService.refresh(
        context,
        localStorageService,
        loginServiceInvalid!,
        LoginTokenViewModel(token: tokenMock, refreshToken: refreshTokenMock));

    expect(mockObserver!.getLastRoute()!.settings!.name, "/login");
  });
}

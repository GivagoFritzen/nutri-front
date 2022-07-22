import 'dart:io';

import 'package:nutri/services/localStorageService.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:nutri/pages/homePage.dart';
import 'package:nutri/pages/loginPage.dart';
import 'package:nutri/services/loginService.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalStorageService()),
        Provider(
          create: (context) => LoginService.create(),
          dispose: (context, LoginService service) => service.client.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginPage()
        },
      ),
    );
  }
}

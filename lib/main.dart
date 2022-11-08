import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nutri/pages/homePage.dart';
import 'package:nutri/pages/loginPage.dart';
import 'package:nutri/pages/nutricionista/pacientesPage.dart';
import 'package:nutri/pages/paciente/medidasPage.dart';
import 'package:nutri/pages/paciente/pacientePage.dart';
import 'package:nutri/pages/paciente/planosAlimentaresPage.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/services/loginService.dart';
import 'package:nutri/services/nutricionistaService.dart';
import 'package:nutri/services/pacienteService.dart';
import 'package:nutri/services/tacoService.dart';
import 'package:provider/provider.dart';

import 'pages/nutricionista/perfilPage.dart';

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
        Provider(
          create: (context) => TacoService.create(),
          dispose: (context, TacoService service) => service.client.dispose(),
        ),
        Provider(
          create: (context) => NutricionistaService.create(),
          dispose: (context, NutricionistaService service) =>
              service.client.dispose(),
        ),
        Provider(
          create: (context) => PacienteService.create(),
          dispose: (context, PacienteService service) =>
              service.client.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Nutri ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
          '/paciente': (context) => const PacientePage(),
          '/paciente/medidas': (context) => const MedidaPage(),
          '/paciente/planosAlimentares': (context) =>
              const PlanosAlimentaresPage(),
          '/nutri/perfil': (context) => const PerfilPage(),
          '/nutri/pacientes': (context) => const PacientesPage(),
        },
      ),
    );
  }
}

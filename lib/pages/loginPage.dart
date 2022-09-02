import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nutri/services/erroService.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:provider/provider.dart';

import '../components/alert.dart';
import '../models/login/loginNutricionistaViewModel.dart';
import '../services/loginService.dart';
import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late LoginService loginService;
  late LocalStorageService localStorageService;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  @override
  void initState() {
    super.initState();

    loginService = Provider.of<LoginService>(context, listen: false);
    localStorageService =
        Provider.of<LocalStorageService>(context, listen: false);
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerSenha.dispose();

    super.dispose();
  }

  _logar() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        Alert.message("emailText"),
      );
    } else {
      final viewModel = LoginNutricionistaViewModel(
        email: _controllerEmail.text,
        senha: _controllerSenha.text,
      );

      var response = await loginService.login(viewModel);

      if (!ErrorService.alertErrors(context, response.error)) {
        localStorageService.setString('token', response.body!.token);
        localStorageService.setString(
            'refreshToken', response.body!.refreshToken);

        Map<String, dynamic> decodedToken = JwtDecoder.decode(response.body!.token);
        localStorageService.setString('name', decodedToken["unique_name"]);
        localStorageService.setString('id', decodedToken["primarysid"]);

        localStorageService.readLocale();
      }
    }
  }

  Widget formField(
      String textoVazio, TextEditingController textController, bool obscure) {
    return TextFormField(
      controller: textController,
      cursorColor: Colors.black,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: textoVazio,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Campo não pode estar vazio";
        }
        return null;
      },
    );
  }

  Widget formButton() {
    return Container(
      width: 150,
      height: 35,
      margin: const EdgeInsets.only(top: 50),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
        ),
        onPressed: _logar,
        child: const Text('Logar'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white24,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .50,
            height: MediaQuery.of(context).size.height * .55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ColorUtil.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(55),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    formField("Email", _controllerEmail, false),
                    formField("Senha", _controllerSenha, true),
                    formButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

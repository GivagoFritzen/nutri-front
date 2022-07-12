import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/alert.dart';
import '../models/login/loginNutricionistaViewModel.dart';
import '../models/login/loginTokenViewModel.dart';
import '../services/loginService.dart';
import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  Widget formField(String textoVazio, TextEditingController textController) {
    return TextFormField(
      controller: textController,
      cursorColor: Colors.black,
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
        onPressed: () async {
          if (!_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              Alert.message("emailText"),
            );
          } else {
            final viewModel = LoginNutricionistaViewModel(
              Email: _controllerEmail.text,
              Senha: _controllerSenha.text,
            );

            final response =
                await Provider.of<LoginService>(context, listen: false)
                    .login(viewModel);

            ScaffoldMessenger.of(context).showSnackBar(
              Alert.message(response.toString()),
            );
          }
        },
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
                    formField("Email", _controllerEmail),
                    formField("Senha", _controllerSenha),
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

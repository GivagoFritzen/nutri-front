import 'package:flutter/material.dart';

import '../components/leftBar.dart';
import '../components/topBar.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final TextEditingController _NomeController = TextEditingController();
  final TextEditingController _SobrenomeController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _CidadeController = TextEditingController();
  final TextEditingController _TelefoneController = TextEditingController();

  String genreValue = 'Homem';
  double fontSize = 25;

  Widget selectGenre() {
    return DropdownButton<String>(
      value: genreValue,
      icon: const Icon(null),
      style: TextStyle(color: Colors.black, fontSize: fontSize),
      underline: const SizedBox(),
      onChanged: (String? newValue) {
        setState(() {
          genreValue = newValue!;
        });
      },
      items: <String>['Homem', 'Mulher']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget perfilField(TextEditingController filter, String hintText) {
    return TextField(
      controller: filter,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black, fontSize: fontSize),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.red,
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget userConfig() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(child: perfilField(_NomeController, "Nome")),
            Expanded(child: perfilField(_SobrenomeController, "Sobrenome")),
          ],
        ),
        perfilField(_EmailController, "Email"),
        perfilField(_CidadeController, "Cidade"),
        perfilField(_TelefoneController, "Telefone"),
        Row(
          children: [
            selectGenre(),
            SizedBox(),
          ],
        ),
      ],
    );
  }

  Widget getHome() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white24,
      child: Column(
        children: <Widget>[
          TopBar(),
          LeftBar(),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            child: userConfig(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getHome());
  }
}

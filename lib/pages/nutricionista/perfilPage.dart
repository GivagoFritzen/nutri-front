import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutri/components/leftBar.dart';
import 'package:nutri/components/topBar.dart';
import 'package:nutri/models/nutricionista/nutricionistaAtualizarViewModel.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/services/nutricionistaService.dart';
import 'package:nutri/utils/colors.dart';
import 'package:provider/provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late NutricionistaService nutricionistaService;
  late LocalStorageService localStorageService;

  final TextEditingController _NomeController = TextEditingController();
  final TextEditingController _SobrenomeController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _CidadeController = TextEditingController();
  final TextEditingController _TelefoneController = TextEditingController();
  final TextEditingController _NovaSenhaeController = TextEditingController();
  final TextEditingController _AntigaSenhaController = TextEditingController();

  String genreValue = 'Homem';
  double fontSize = 25;

  @override
  void initState() {
    super.initState();

    nutricionistaService =
        Provider.of<NutricionistaService>(context, listen: false);
    localStorageService =
        Provider.of<LocalStorageService>(context, listen: false);

    _load();
  }

  void _load() async {
    var response = await nutricionistaService.getById(
        id: localStorageService.local["id"]!,
        token: "Bearer ${localStorageService.local["token"]}");

    if (response.error != null) {
      //Refresh or LoginPage
    }

    _SobrenomeController.text = response.body!.sobrenome!;
    _EmailController.text = response.body!.email!;
    _CidadeController.text = response.body!.cidade!;
    _TelefoneController.text = response.body!.telefone!;

    _NomeController.text = response.body!.nome!;
    localStorageService.setString('name', response.body!.nome!);

    genreValue = response.body!.sexo == true ? "Homem" : "Mulher";

    localStorageService.readLocale();
  }

  @override
  void dispose() {
    _NomeController.dispose();
    _SobrenomeController.dispose();
    _EmailController.dispose();
    _CidadeController.dispose();
    _TelefoneController.dispose();
    _NovaSenhaeController.dispose();
    _AntigaSenhaController.dispose();

    super.dispose();
  }

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
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget updateButton() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtil.green,
          minimumSize: const Size(200, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        onPressed: () {
          var nutricionistaAtualizarViewModel =
              new NutricionistaAtualizarViewModel();

          nutricionistaAtualizarViewModel.id = localStorageService.local["id"];
          nutricionistaAtualizarViewModel.nome = _NomeController.value.text;
          nutricionistaAtualizarViewModel.sobrenome =
              _SobrenomeController.value.text;
          nutricionistaAtualizarViewModel.email = _EmailController.value.text;
          nutricionistaAtualizarViewModel.cidade = _CidadeController.value.text;
          nutricionistaAtualizarViewModel.telefone =
              _TelefoneController.value.text;
          nutricionistaAtualizarViewModel.sexo =
              genreValue == "Homem" ? true : false;
          nutricionistaAtualizarViewModel.antigaSenha =
              _AntigaSenhaController.value.text;
          nutricionistaAtualizarViewModel.novaSenha =
              _NovaSenhaeController.value.text;

          nutricionistaService.atualizar(
              nutricionistaAtualizarViewModel: nutricionistaAtualizarViewModel,
              token: "Bearer ${localStorageService.local["token"]}");

          localStorageService.setString('name', _NomeController.value.text);

          localStorageService.readLocale();
        },
        child: Text(
          "Atualizar",
          style: TextStyle(fontSize: fontSize),
        ),
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
            Expanded(child: perfilField(_NovaSenhaeController, "Nova Senha")),
            Expanded(
                child: perfilField(_AntigaSenhaController, "Antiga Senha")),
          ],
        ),
        Row(
          children: [
            selectGenre(),
            const SizedBox(),
          ],
        ),
        updateButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              TopBar(),
              Container(
                height:
                    MediaQuery.of(context).size.height - TopBar.GetHeightSize(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LeftBar(),
                    Container(
                      color: Colors.white24,
                      width: MediaQuery.of(context).size.width * .5,
                      child: userConfig(),
                    ),
                    const SizedBox()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

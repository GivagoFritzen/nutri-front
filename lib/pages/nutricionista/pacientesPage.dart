import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:nutri/components/leftBar.dart';
import 'package:nutri/components/topBar.dart';
import 'package:nutri/models/login/loginTokenViewModel.dart';
import 'package:nutri/models/paciente/pacienteSimplificadoViewModel.dart';
import 'package:nutri/services/erroService.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/services/loginService.dart';
import 'package:nutri/services/nutricionistaService.dart';
import 'package:nutri/services/refreshTokenService.dart';
import 'package:nutri/utils/colors.dart';
import 'package:provider/provider.dart';

class PacientesPage extends StatefulWidget {
  const PacientesPage({Key? key}) : super(key: key);

  @override
  _PacientesPageState createState() => _PacientesPageState();
}

class _PacientesPageState extends State<PacientesPage> {
  late NutricionistaService nutricionistaService;
  late LocalStorageService localStorageService;
  late LoginService loginService;

  final TextEditingController _controllerEmail = TextEditingController();

  final _scrollController = ScrollController();
  late List<PacienteSimplificadoViewModel> pacientes = List.empty();

  @override
  void initState() {
    super.initState();

    nutricionistaService =
        Provider.of<NutricionistaService>(context, listen: false);
    localStorageService =
        Provider.of<LocalStorageService>(context, listen: false);
    loginService = Provider.of<LoginService>(context, listen: false);

    _load();
  }

  void _load() async {
    var response = await nutricionistaService.getPacientes(
        id: localStorageService.local["id"]!,
        token: "Bearer ${localStorageService.local["token"]}");

    if (response.error == null) {
      setState(() {
        pacientes = response.body!;
      });
    } else {
      RefreshTokenService.refresh(
          context,
          localStorageService,
          loginService,
          LoginTokenViewModel(
              token: localStorageService.local["token"]!,
              refreshToken: localStorageService.local["refreshToken"]!));
    }
  }

  Widget pacienteInfo(String info) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            info,
            style: const TextStyle(color: Colors.black, fontSize: 19),
          ),
        ),
      ),
    );
  }

  TableRow cabecalho() {
    return TableRow(
      children: [
        pacienteInfo(translate('page-pacientes.cabecalho.nome')),
        pacienteInfo(translate('page-pacientes.cabecalho.sobrenome')),
        pacienteInfo(translate('page-pacientes.cabecalho.email')),
        pacienteInfo(translate('page-pacientes.cabecalho.telefone')),
        const SizedBox(),
        const SizedBox(),
      ],
    );
  }

  TableRow paciente(PacienteSimplificadoViewModel paciente) {
    return TableRow(
      children: [
        pacienteInfo(paciente.nome!),
        pacienteInfo(paciente.sobrenome!),
        pacienteInfo(paciente.email!),
        pacienteInfo(paciente.telefone!),
        TextButton(
          onPressed: () async => {
            Navigator.pushNamed(
              context,
              '/paciente',
              arguments: {'paciente-id': paciente.id},
            )
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Tooltip(
                message: translate('page-pacientes.icones.editar'),
                child: const Icon(
                  Icons.person_add_alt_1_outlined,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () async => {_desvincular(paciente.email!)},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Tooltip(
                message: translate('page-pacientes.icones.excluir'),
                child: const Icon(
                  IconData(0xe1b9, fontFamily: 'MaterialIcons'),
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<bool> _vincular() async {
    var response = await nutricionistaService.vincular(
        pacienteEmail: _controllerEmail.text,
        token: "Bearer ${localStorageService.local["token"]}");

    return ErrorService.alertErrors(context, response.error);
  }

  Future _desvincular(String pacienteEmail) async {
    var response = await nutricionistaService.desvincular(
        paciente: pacienteEmail,
        token: "Bearer ${localStorageService.local["token"]}");

    if (!ErrorService.alertErrors(context, response.error)) _load();
  }

  ElevatedButton botaoVincular() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorUtil.green,
        minimumSize: const Size(200, 45),
      ),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(translate('page-pacientes.adicionar.texto')),
          content: TextFormField(
            controller: _controllerEmail,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: translate('page-pacientes.adicionar.texto-campo'),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text(translate('page-pacientes.botao.cancelar')),
            ),
            TextButton(
              onPressed: () async => {
                if (await _vincular() == false)
                  {
                    _load(),
                    Navigator.pop(context, 'Vincular'),
                  }
              },
              child: Text(translate('page-pacientes.botao.vincular')),
            ),
          ],
        ),
      ).then((exit) {
        _controllerEmail.text = "";
      }),
      child: Text(translate('page-pacientes.botao.vincular')),
    );
  }

  Column tabelaPacientes() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 150,
          padding: const EdgeInsets.all(20.0),
          child: Scrollbar(
            thumbVisibility: true,
            controller: _scrollController,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              child: Table(
                border: const TableBorder(
                    horizontalInside: BorderSide(
                  width: 1,
                  color: Colors.grey,
                  style: BorderStyle.solid,
                )),
                children: [
                  cabecalho(),
                  for (var e in pacientes) paciente(e),
                ],
              ),
            ),
          ),
        ),
        botaoVincular(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(clipBehavior: Clip.none, children: [
        Column(
          children: [
            const TopBar(),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height - TopBar.GetHeightSize(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeftBar(context: context),
                  Container(
                    color: Colors.white24,
                    width:
                        MediaQuery.of(context).size.width - LeftBar.GetWidth(),
                    child: tabelaPacientes(),
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

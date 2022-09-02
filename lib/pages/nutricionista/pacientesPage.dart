import 'package:flutter/material.dart';
import 'package:nutri/components/leftBar.dart';
import 'package:nutri/components/topBar.dart';
import 'package:nutri/models/nutricionista/nutricionistaDesvincularOuVincularViewModel.dart';
import 'package:nutri/models/paciente/pacienteSimplificadoViewModel.dart';
import 'package:nutri/services/erroService.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/services/nutricionistaService.dart';
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
        pacienteInfo("Nome"),
        pacienteInfo("Sobrenome"),
        pacienteInfo("Email"),
        pacienteInfo("Telefone"),
        const SizedBox()
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
          onPressed: () async => {_desvincular(paciente.email!)},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                IconData(0xe1b9, fontFamily: 'MaterialIcons'),
                color: Colors.black87,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<bool> _vincular() async {
    var viewModel = new NutricionistaDesvincularOuVincularViewModel();
    viewModel.id = "6ce86526-6a27-4703-a4ae-50d7b50b8a7a";
    viewModel.pacienteEmail = _controllerEmail.text;

    var response = await nutricionistaService.vincular(
        nutricionistaDesvincularOuVincularViewModel: viewModel,
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
          title: const Text('Adicionar Paciente'),
          content: TextFormField(
            controller: _controllerEmail,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              hintText: "Paciente Email",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async => {
                if (await _vincular() == false)
                  {
                    _load(),
                    Navigator.pop(context, 'Vincular'),
                  }
              },
              child: const Text('Vincular'),
            ),
          ],
        ),
      ),
      child: const Text("Vincular"),
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
                  const LeftBar(),
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

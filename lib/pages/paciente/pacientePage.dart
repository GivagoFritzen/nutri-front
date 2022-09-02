import 'package:flutter/material.dart';
import 'package:nutri/components/leftBar.dart';
import 'package:nutri/components/topBar.dart';
import 'package:nutri/models/paciente/pacienteAtualizarViewModel.dart';
import 'package:nutri/models/paciente/pacienteViewModel.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/services/pacienteService.dart';
import 'package:nutri/utils/colors.dart';
import 'package:provider/provider.dart';

class PacientePage extends StatefulWidget {
  const PacientePage({Key? key}) : super(key: key);

  @override
  _PacientePageState createState() => _PacientePageState();
}

class _PacientePageState extends State<PacientePage> {
  late PacienteService pacienteService;
  late LocalStorageService localStorageService;

  late PacienteViewModel pacienteViewModel;

  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerSobrenome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerCidade = TextEditingController();
  final TextEditingController _controllerTelefone = TextEditingController();

  @override
  void initState() {
    super.initState();

    pacienteService = Provider.of<PacienteService>(context, listen: false);
    localStorageService =
        Provider.of<LocalStorageService>(context, listen: false);

    _load();
  }

  void _load() async {
    var response = await pacienteService.getById(
      id: "6b08f77f-e158-41d6-ae4d-0471ca15d8b6",
      token:
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkdpdmFnbzEyIiwiZW1haWwiOiJudXRyaUB0ZXN0ZS5jb20iLCJwcmltYXJ5c2lkIjoiNmNlODY1MjYtNmEyNy00NzAzLWE0YWUtNTBkN2I1MGI4YTdhIiwicm9sZSI6Ik51dHJpY2lvbmlzdGEiLCJuYmYiOjE2NjExMTUxNzEsImV4cCI6MTY2MTEyMjMxNCwiaWF0IjoxNjYxMTE1MTcxfQ.U-QFxzpi5sO_BkWjOyK2froKsvVh12Nk-ZRAIBUqPPY",
    );

    if (response.error == null) {
      setState(() {
        pacienteViewModel = response.body!;
      });

      _controllerNome.text = pacienteViewModel.nome!;
      _controllerSobrenome.text = pacienteViewModel.sobrenome!;
      _controllerEmail.text = pacienteViewModel.email!;
      _controllerCidade.text = pacienteViewModel.cidade!;
      _controllerTelefone.text = pacienteViewModel.telefone!;
    }
  }

  Widget deletarButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorUtil.red,
        minimumSize: const Size(200, 55),
      ),
      onPressed: () {},
      child: Text("Deletar"),
    );
  }

  Widget medidasButton() {
    return Container(
      margin: const EdgeInsets.only(left: 25.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtil.blue,
          minimumSize: const Size(200, 55),
        ),
        onPressed: () {},
        child: Text("Medidas"),
      ),
    );
  }

  Widget planoAlimentarButton() {
    return Container(
      margin: const EdgeInsets.only(left: 25.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtil.blue,
          minimumSize: const Size(200, 55),
        ),
        onPressed: () {},
        child: Text("Planos Alimentares"),
      ),
    );
  }

  Widget salvarButton() {
    return Container(
      margin: const EdgeInsets.only(left: 25.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtil.green,
          minimumSize: const Size(200, 55),
        ),
        onPressed: () async {
          var pacienteAtualizarViewModel = PacienteAtualizarViewModel(
            nome: _controllerNome.text,
            sobrenome: _controllerSobrenome.text,
            email: _controllerEmail.text,
            cidade: _controllerCidade.text,
            telefone: _controllerTelefone.text,
            sexo: pacienteViewModel!.sexo!,
            id: pacienteViewModel!.id!,
          );

          var response = await pacienteService.atualizar(
            pacienteAtualizarViewModel: pacienteAtualizarViewModel,
            token:
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkdpdmFnbzEyIiwiZW1haWwiOiJudXRyaUB0ZXN0ZS5jb20iLCJwcmltYXJ5c2lkIjoiNmNlODY1MjYtNmEyNy00NzAzLWE0YWUtNTBkN2I1MGI4YTdhIiwicm9sZSI6Ik51dHJpY2lvbmlzdGEiLCJuYmYiOjE2NjExMTUxNzEsImV4cCI6MTY2MTEyMjMxNCwiaWF0IjoxNjYxMTE1MTcxfQ.U-QFxzpi5sO_BkWjOyK2froKsvVh12Nk-ZRAIBUqPPY",
          );

          setState(() {
            pacienteViewModel = PacienteViewModel(
                nome: response.body!.nome,
                sobrenome: response.body!.sobrenome,
                email: response.body!.email,
                cidade: response.body!.cidade,
                telefone: response.body!.telefone,
                sexo: response.body!.sexo,
                medidas: pacienteViewModel.medidas,
                planoAlimentares: pacienteViewModel.planoAlimentares);
          });
        },
        child: Text("Salvar"),
      ),
    );
  }

  Widget pacienteRow(String name, TextEditingController textController) {
    return Row(
      children: [
        Text(name),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: TextFormField(
              controller: textController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo não pode estar vazio";
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget pacienteInfo() {
    return Container(
      height: MediaQuery.of(context).size.height - 150,
      padding: const EdgeInsets.fromLTRB(55, 15, 55, 15),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(child: pacienteRow("Nome", _controllerNome)),
                Expanded(child: pacienteRow("Sobrenome", _controllerSobrenome)),
              ],
            ),
            pacienteRow("Email", _controllerEmail),
            pacienteRow("Cidade", _controllerCidade),
            pacienteRow("Telefone", _controllerTelefone),
            SizedBox(),
            SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                deletarButton(),
                medidasButton(),
                planoAlimentarButton(),
                salvarButton(),
              ],
            )
          ],
        ),
      ),
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
                    child: pacienteInfo(),
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

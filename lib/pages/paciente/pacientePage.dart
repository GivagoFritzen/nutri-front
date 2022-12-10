import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:nutri/components/leftBar.dart';
import 'package:nutri/components/topBar.dart';
import 'package:nutri/models/paciente/pacienteAdicionarViewModel.dart';
import 'package:nutri/models/paciente/pacienteAtualizarViewModel.dart';
import 'package:nutri/models/paciente/pacienteViewModel.dart';
import 'package:nutri/services/erroService.dart';
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

  String genreValue = translate('perfil.sexo.homem');
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

    Future.delayed(Duration.zero, () {
      _load(getPacienteId());
    });
  }

  void _load(String? pacienteId) async {
    if (pacienteId == null || pacienteId.isEmpty) return;

    var response = await pacienteService.getById(
      id: pacienteId,
      token: "Bearer ${localStorageService.local["token"]}",
    );

    if (response.error == null) {
      setState(() {
        pacienteViewModel = response.body!;
        genreValue = response.body!.sexo == true
            ? translate('perfil.sexo.homem')
            : translate('perfil.sexo.mulher');
      });

      _controllerNome.text = pacienteViewModel.nome!;
      _controllerSobrenome.text = pacienteViewModel.sobrenome!;
      _controllerEmail.text = pacienteViewModel.email!;
      _controllerCidade.text = pacienteViewModel.cidade!;
      _controllerTelefone.text = pacienteViewModel.telefone!;
    }
  }

  Widget medidasButton() {
    return Container(
      margin: const EdgeInsets.only(left: 25.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtil.blue,
          minimumSize: const Size(200, 55),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/paciente/medidas',
            arguments: {'paciente-id': getPacienteId()},
          );
        },
        child: Text(translate('page-paciente.botao.medidas')),
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
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/paciente/planosAlimentares',
            arguments: {'paciente-id': getPacienteId()},
          );
        },
        child: Text(translate('page-paciente.botao.planos-alimentares')),
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
          var pacienteAdicionarViewModel = PacienteAdicionarViewModel(
              nome: _controllerNome.text,
              sobrenome: _controllerSobrenome.text,
              email: _controllerEmail.text,
              cidade: _controllerCidade.text,
              telefone: _controllerTelefone.text,
              sexo:
                  genreValue == translate('perfil.sexo.homem') ? true : false);

          var response = await pacienteService.adicionar(
            pacienteAdicionarViewModel: pacienteAdicionarViewModel,
            token: "Bearer ${localStorageService.local["token"]}",
          );

          if (!ErrorService.alertErrors(context, response.error)) {
            Navigator.pushNamed(
              context,
              '/nutri/pacientes',
            );
          }
        },
        child: Text(translate('page-paciente.botao.salvar')),
      ),
    );
  }

  Widget atualizarButton() {
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
            sexo: genreValue == translate('perfil.sexo.homem') ? true : false,
            id: pacienteViewModel!.id!,
          );

          var response = await pacienteService.atualizar(
            pacienteAtualizarViewModel: pacienteAtualizarViewModel,
            token: "Bearer ${localStorageService.local["token"]}",
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

          Navigator.pushNamed(
            context,
            '/nutri/pacientes',
          );
        },
        child: Text(translate('page-paciente.botao.atualizar')),
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
                Expanded(
                    child: pacienteRow(
                        translate('perfil.campo.nome'), _controllerNome)),
                Expanded(
                    child: pacienteRow(translate('perfil.campo.sobrenome'),
                        _controllerSobrenome)),
              ],
            ),
            pacienteRow(translate('perfil.campo.email'), _controllerEmail),
            pacienteRow(translate('perfil.campo.cidade'), _controllerCidade),
            pacienteRow(
                translate('perfil.campo.telefone'), _controllerTelefone),
            selectGenre(),
            SizedBox(),
            SizedBox(),
            getPacienteId() != null && !getPacienteId()!.isEmpty
                ? buttonsExistencePaciente()
                : buttonsNewPaciente()
          ],
        ),
      ),
    );
  }

  String? getPacienteId() {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return arguments['paciente-id'];
  }

  Widget selectGenre() {
    return DropdownButton<String>(
      value: genreValue,
      style: TextStyle(color: Colors.black),
      underline: const SizedBox(),
      onChanged: (String? newValue) {
        setState(() {
          genreValue = newValue!;
        });
      },
      items: <String>[
        translate('perfil.sexo.homem'),
        translate('perfil.sexo.mulher')
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Row buttonsExistencePaciente() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        medidasButton(),
        planoAlimentarButton(),
        atualizarButton(),
      ],
    );
  }

  Row buttonsNewPaciente() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        salvarButton(),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutri/components/dropdownfield/dropdownfield.dart';
import 'package:nutri/components/leftBar.dart';
import 'package:nutri/components/topBar.dart';
import 'package:nutri/models/alimento/alimentoViewModel.dart';
import 'package:nutri/models/planoAlimentar/planoAlimentarViewModel.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/services/pacienteService.dart';
import 'package:nutri/utils/colors.dart';
import 'package:provider/provider.dart';

class PlanosAlimentaresPage extends StatefulWidget {
  const PlanosAlimentaresPage({Key? key}) : super(key: key);

  @override
  _PlanosAlimentaresPageState createState() => _PlanosAlimentaresPageState();
}

class _PlanosAlimentaresPageState extends State<PlanosAlimentaresPage> {
  late PacienteService pacienteService;
  late LocalStorageService localStorageService;

  late List<PlanoAlimentarViewModel> planosAlimentaresViewModel = List.empty();
  late List<AlimentoViewModel> alimentos = <AlimentoViewModel>[];

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    //final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    pacienteService = Provider.of<PacienteService>(context, listen: false);
    localStorageService =
        Provider.of<LocalStorageService>(context, listen: false);

    _load();
  }

  Future<void> _load() async {
    var response = await pacienteService.getPlanosAlimentaresById(
      id: "d8ee969d-6bdb-41a3-974f-260878c9013b",
      token:
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Im51dHJpIiwiZW1haWwiOiJudXRyaUB0ZXN0ZS5jb20iLCJwcmltYXJ5c2lkIjoiYjAxMTE3NzgtMGQ0Ny00NGY5LWEzZGYtNDRkNTFlYmNmMThhIiwicm9sZSI6Ik51dHJpY2lvbmlzdGEiLCJuYmYiOjE2NjMzNjE1NDEsImV4cCI6MTY2MzM2ODQxMCwiaWF0IjoxNjYzMzYxNTQxfQ.KMAoXjVRiJX76XTrlDeyHY8Zs-xTOkpfZNzE8bV-yw0",
    );

    if (response.error == null) {
      setState(() {
        planosAlimentaresViewModel = response.body!;
      });
    }
  }

  AlertDialog adicionarRefeicaoAlert(context, setState) {
    return AlertDialog(
      title: const Center(child: Text('Adicionar Refeicao')),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Column(
            children: [
              for (var alimento in alimentos) alimentoRow(alimento),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            setState(() {
              alimentos.add(AlimentoViewModel());
            }),
          },
          child: const Text('Adicionar Alimentação'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'Cancel'),
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async => {
            /*
            if (await _adicionarMedida() == false)
              {
                await _load(),
                Navigator.pop(context, 'Vincular'),
              }
            */
          },
          child: const Text('Vincular'),
        ),
      ],
    );
  }

  Widget adicionarButton() {
    return Container(
      margin: const EdgeInsets.only(left: 25.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtil.green,
          minimumSize: const Size(200, 55),
        ),
        onPressed: () => showDialog<String>(
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return adicionarRefeicaoAlert(context, setState);
              });
            }).then((exit) {
          setState(() {
            alimentos = <AlimentoViewModel>[];
          });
        }),
        child: const Text("Adicionar Plano Alimentar"),
      ),
    );
  }

  Widget alimentoRow(AlimentoViewModel alimento) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Dropdownfield(
            labelText: "Alimento",
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 155,
          child: TextField(
            onChanged: (text) {
              alimento.medida = int.parse(text);
            },
            textAlign: TextAlign.center,
            maxLength: 4,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: true,
            ),
            decoration: const InputDecoration(labelText: 'Medida'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 155,
          child: TextField(
            onChanged: (text) {
              alimento.quantidade = int.parse(text);
            },
            textAlign: TextAlign.center,
            maxLength: 4,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: true,
            ),
            decoration: const InputDecoration(labelText: 'Quantidade'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
      ],
    );
  }

  Widget planoAlimentarRow(PlanoAlimentarViewModel planoAlimentar) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtil.blue,
          minimumSize: const Size(double.infinity, 55),
        ),
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => SizedBox(),
        ),
        child: Text(planoAlimentar.data!),
      ),
    );
  }

  Widget planosAlimentares() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 150,
          padding: const EdgeInsets.fromLTRB(55, 15, 55, 15),
          child: Scrollbar(
            thumbVisibility: true,
            controller: _scrollController,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              child: Column(
                children: <Widget>[
                  for (var planoAlimentar in planosAlimentaresViewModel)
                    planoAlimentarRow(planoAlimentar)
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              adicionarButton(),
            ],
          ),
        ),
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
                    child: planosAlimentares(),
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

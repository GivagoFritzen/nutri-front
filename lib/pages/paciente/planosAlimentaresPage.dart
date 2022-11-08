import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nutri/components/dropdownfield/dropdownMedidaCaseira.dart';
import 'package:nutri/components/dropdownfield/dropdownfield.dart';
import 'package:nutri/components/leftBar.dart';
import 'package:nutri/components/topBar.dart';
import 'package:nutri/enum/medidaCaseira.dart';
import 'package:nutri/models/alimento/alimentoViewModel.dart';
import 'package:nutri/models/paciente/pacientePlanoAlimentarViewModel.dart';
import 'package:nutri/models/planoAlimentar/planoAlimentarViewModel.dart';
import 'package:nutri/models/refeicao/refeicaoViewModel.dart';
import 'package:nutri/services/erroService.dart';
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
  late List<RefeicaoViewModel> refeicoes = <RefeicaoViewModel>[];
  late List<AlimentoViewModel> alimentos = <AlimentoViewModel>[];

  final _scrollController = ScrollController();
  final _refeicaoScrollController = ScrollController();
  final _alimentosScrollController = ScrollController();

  RefeicaoViewModel refeicaoTemp = RefeicaoViewModel.empty();
  List<RefeicaoViewModel> refeicoesTemp = <RefeicaoViewModel>[];
  List<AlimentoViewModel> alimentoTemp = <AlimentoViewModel>[];

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
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Im51dHJpIiwiZW1haWwiOiJudXRyaUB0ZXN0ZS5jb20iLCJwcmltYXJ5c2lkIjoiYjAxMTE3NzgtMGQ0Ny00NGY5LWEzZGYtNDRkNTFlYmNmMThhIiwicm9sZSI6Ik51dHJpY2lvbmlzdGEiLCJuYmYiOjE2Njc4NjI2NjYsImV4cCI6MTY2Nzg2OTg1NywiaWF0IjoxNjY3ODYyNjY2fQ.eNbMnHBL3mkUqMLxgJX3QM-ApewBD__AiK-SjNHtai8",
    );

    if (response.error == null) {
      setState(() {
        planosAlimentaresViewModel = response.body!;
      });
    }
  }

  Widget alimentoRow(AlimentoViewModel alimento, Function deleteAction) {
    var nomeEditingController = TextEditingController();
    var medidaEditingController = TextEditingController();
    var quantidadeEditingController = TextEditingController();

    if (alimento.nome != null) {
      nomeEditingController.text = alimento.nome!;
    }
    if (alimento.medida != null) {
      medidaEditingController.text = alimento.medida.toString();
    }
    if (alimento.quantidade != null) {
      quantidadeEditingController.text = alimento.quantidade.toString();
    }
    if (alimento.medida == null) {
      alimento.medida = MedidaCaseira.Grama;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Dropdownfield(
            labelText: "Alimento",
            textEditingController: nomeEditingController,
            updateValue: (String text) {
              alimento.nome = text;
            },
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 155,
          child: DropdownMedidaCaseira(alimento: alimento),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 155,
          child: TextField(
            onChanged: (text) {
              alimento.quantidade = int.parse(text);
            },
            controller: quantidadeEditingController,
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
        const SizedBox(width: 15),
        IconButton(
          onPressed: () => deleteAction(),
          icon: const Icon(
            Icons.close,
            size: 18.0,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Future<Null> _selectTime(
      BuildContext context, setState, RefeicaoViewModel refeicao) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 00, minute: 00),
    );

    picked ??= const TimeOfDay(hour: 0, minute: 0);

    setState(() {
      refeicao.horario =
          DateTime(0, 0, 0, picked!.hour, picked.minute, 0, 0, 0);
    });
  }

  AlertDialog adicionarRefeicaoAlert(context, setState, int index) {
    var textEditingController = TextEditingController();
    if (refeicoes[index].descricao!.isNotEmpty) {
      textEditingController.text = refeicoes[index].descricao!;
    }

    return AlertDialog(
      title: const Center(child: Text('Refeicao')),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Scrollbar(
            thumbVisibility: true,
            controller: _alimentosScrollController,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _alimentosScrollController,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (text) {
                            refeicoes[index].descricao = text;
                          },
                          controller: textEditingController,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Descrição",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          maxLength: 25,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.access_time),
                        tooltip: 'Adicionar Horário',
                        onPressed: () {
                          _selectTime(context, setState, refeicoes[index]);
                        },
                      ),
                      Text(DateFormat.Hm().format(refeicoes[index].horario!)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  for (var alimento in alimentos)
                    alimentoRow(
                        alimento,
                        () => setState(() {
                              alimentos.remove(alimento);
                            })),
                ],
              ),
            ),
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
          onPressed: () async => {
            setState(() {
              refeicoes[index].alimentos = alimentoTemp;
            }),
            Navigator.pop(context, 'Cancel'),
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async => {
            setState(() {
              refeicoes[index].alimentos = <AlimentoViewModel>[];
              refeicoes[index].alimentos!.addAll(alimentos);
            }),
            Navigator.pop(context, 'Ok'),
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }

  Widget refeicaoRow(context, setState, int index) {
    var refeicao = refeicoes[index];

    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtil.green,
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.45,
                  55,
                ),
              ),
              onPressed: () => {
                setState(() {
                  refeicaoTemp = RefeicaoViewModel.clone(refeicao);
                }),
                if (refeicoes[index].alimentos!.isNotEmpty)
                  {
                    alimentoTemp = <AlimentoViewModel>[],
                    for (var alimento in refeicoes[index].alimentos!)
                      {alimentoTemp.add(AlimentoViewModel.clone(alimento))},
                    setState(() {
                      alimentos = refeicoes[index].alimentos!;
                    })
                  },
                showDialog<String>(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setState) {
                        return adicionarRefeicaoAlert(context, setState, index);
                      });
                    }).then((exit) {
                  setState(() {
                    alimentos = <AlimentoViewModel>[];
                    refeicaoTemp = RefeicaoViewModel.empty();
                    alimentoTemp = <AlimentoViewModel>[];
                  });
                })
              },
              child: Text(refeicoes[index].descricao != null &&
                      refeicoes[index].descricao!.isNotEmpty
                  ? refeicoes[index].descricao!
                  : ""),
            ),
            IconButton(
              onPressed: () => setState(() {
                refeicoes.remove(refeicoes[index]);
              }),
              icon: const Icon(
                Icons.close,
                size: 18.0,
                color: Colors.red,
              ),
            ),
          ],
        ));
  }

  Future<bool> _vincular() async {
    var viewModel = PacientePlanoAlimentarViewModel(
        pacienteId: "d8ee969d-6bdb-41a3-974f-260878c9013b",
        refeicoes: refeicoes);

    var response = await pacienteService.adicionarPlanoAlimentar(
        pacienteViewModel: viewModel,
        token:
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Im51dHJpIiwiZW1haWwiOiJudXRyaUB0ZXN0ZS5jb20iLCJwcmltYXJ5c2lkIjoiYjAxMTE3NzgtMGQ0Ny00NGY5LWEzZGYtNDRkNTFlYmNmMThhIiwicm9sZSI6Ik51dHJpY2lvbmlzdGEiLCJuYmYiOjE2Njc4NjI2NjYsImV4cCI6MTY2Nzg2OTg1NywiaWF0IjoxNjY3ODYyNjY2fQ.eNbMnHBL3mkUqMLxgJX3QM-ApewBD__AiK-SjNHtai8");

    return ErrorService.alertErrors(context, response.error);
  }

  Widget planoAlimentarDialog(context, setState) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: Scrollbar(
          thumbVisibility: true,
          controller: _refeicaoScrollController,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: _refeicaoScrollController,
            child: Column(children: [
              for (var i = refeicoes.length - 1; i >= 0; i -= 1)
                refeicaoRow(context, setState, i),
            ]),
          ),
        ),
      ),
    );
  }

  AlertDialog atualizarPlanoAlimentarAlert(
      context, setState, PlanoAlimentarViewModel planoAlimentar) {
    return AlertDialog(
      title: const Center(child: Text('Atualizar Plano Alimentar')),
      content: planoAlimentarDialog(context, setState),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            setState(() {
              refeicoes.add(RefeicaoViewModel.empty());
            }),
          },
          child: const Text('Adicionar Refeição'),
        ),
        TextButton(
          onPressed: () => {
            refeicoes = refeicoesTemp,
            Navigator.pop(context, 'Cancel'),
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async => {
            if (await _vincular() == false)
              {
                refeicoes = <RefeicaoViewModel>[],
                alimentos = <AlimentoViewModel>[],
                refeicaoTemp = RefeicaoViewModel.empty(),
                alimentoTemp = <AlimentoViewModel>[],
                await _load(),
                Navigator.pop(context, 'Salvar'),
              }
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }

  AlertDialog adicionarPlanoAlimentarAlert(context, setState) {
    return AlertDialog(
      title: const Center(child: Text('Adicionar Plano Alimentar')),
      content: planoAlimentarDialog(context, setState),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            setState(() {
              refeicoes.add(RefeicaoViewModel.empty());
            }),
          },
          child: const Text('Adicionar Refeição'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'Cancel'),
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async => {
            if (await _vincular() == false)
              {
                refeicoes = <RefeicaoViewModel>[],
                alimentos = <AlimentoViewModel>[],
                refeicaoTemp = RefeicaoViewModel.empty(),
                alimentoTemp = <AlimentoViewModel>[],
                await _load(),
                Navigator.pop(context, 'Vincular'),
              }
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
                return adicionarPlanoAlimentarAlert(context, setState);
              });
            }).then((exit) {
          setState(() {
            refeicoes = <RefeicaoViewModel>[];
          });
        }),
        child: const Text("Adicionar Plano Alimentar"),
      ),
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
            builder: (context) {
              refeicoes = planoAlimentar.refeicoes!;
              refeicoesTemp = [...refeicoes];
              return StatefulBuilder(builder: (context, setState) {
                return atualizarPlanoAlimentarAlert(
                    context, setState, planoAlimentar);
              });
            }).then((value) => {
              if(value == null || value == 'Cancel'){
                planoAlimentar.refeicoes = refeicoesTemp,
                refeicoes = <RefeicaoViewModel>[],
                alimentos = <AlimentoViewModel>[],
                refeicaoTemp = RefeicaoViewModel.empty(),
                alimentoTemp = <AlimentoViewModel>[],
              }
            }),
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

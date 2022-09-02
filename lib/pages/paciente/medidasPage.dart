import 'package:flutter/material.dart';
import 'package:nutri/components/leftBar.dart';
import 'package:nutri/components/numberInputWithIncrementDecrement.dart';
import 'package:nutri/components/topBar.dart';
import 'package:nutri/models/circuferencia/circunferenciaViewModel.dart';
import 'package:nutri/models/medida/medidaAdicionarViewModel.dart';
import 'package:nutri/models/medida/medidaViewModel.dart';
import 'package:nutri/services/erroService.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:nutri/services/pacienteService.dart';
import 'package:nutri/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class MedidaPage extends StatefulWidget {
  const MedidaPage({Key? key}) : super(key: key);

  @override
  _MedidaPageState createState() => _MedidaPageState();
}

class _MedidaPageState extends State<MedidaPage> {
  late PacienteService pacienteService;
  late LocalStorageService localStorageService;

  late List<MedidaViewModel> medidasViewModel = List.empty();

  final _scrollController = ScrollController();

  final TextEditingController controllerPesoAtual = TextEditingController();
  final TextEditingController controllerPesoIdeal = TextEditingController();
  final TextEditingController controllerAltura = TextEditingController();
  final TextEditingController controllerBracoRelaxadoDireito =
      TextEditingController();
  final TextEditingController controllerBracoRelaxadoEsquerdo =
      TextEditingController();
  final TextEditingController controllerBracoContraidoDireito =
      TextEditingController();
  final TextEditingController controllerBracoContraidoEsquerdo =
      TextEditingController();
  final TextEditingController controllerAntebracoDireito =
      TextEditingController();
  final TextEditingController controllerAntebracoEsquerdo =
      TextEditingController();
  final TextEditingController controllerPunhoDireito = TextEditingController();
  final TextEditingController controllerPunhoEsquerdo = TextEditingController();
  final TextEditingController controllerPescoco = TextEditingController();
  final TextEditingController controllerOmbro = TextEditingController();
  final TextEditingController controllerPeitoral = TextEditingController();
  final TextEditingController controllerCintura = TextEditingController();
  final TextEditingController controllerAbdomen = TextEditingController();
  final TextEditingController controllerQuadril = TextEditingController();
  final TextEditingController controllerPanturrilhaDireita =
      TextEditingController();
  final TextEditingController controllerPanturrilhaEsquerda =
      TextEditingController();
  final TextEditingController controllerCoxaDireita = TextEditingController();
  final TextEditingController controllerCoxaEsquerda = TextEditingController();
  final TextEditingController controllerCoxaProximalDireita =
      TextEditingController();
  final TextEditingController controllerCoxaProximalEsquerda =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    //final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    pacienteService = Provider.of<PacienteService>(context, listen: false);
    localStorageService =
        Provider.of<LocalStorageService>(context, listen: false);

    _load();
  }

  void _load() async {
    var response = await pacienteService.getMedidasById(
      id: "6b08f77f-e158-41d6-ae4d-0471ca15d8b6",
      token:
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkdpdmFnbzEyIiwiZW1haWwiOiJudXRyaUB0ZXN0ZS5jb20iLCJwcmltYXJ5c2lkIjoiNmNlODY1MjYtNmEyNy00NzAzLWE0YWUtNTBkN2I1MGI4YTdhIiwicm9sZSI6Ik51dHJpY2lvbmlzdGEiLCJuYmYiOjE2NjIxMjk2OTksImV4cCI6MTY2MjEzNjgyNSwiaWF0IjoxNjYyMTI5Njk5fQ.aLUuqBK7HPrwARGSsqNl_oMBIxJ4u65WDhsC9JbeM5A",
    );

    if (response.error == null) {
      setState(() {
        medidasViewModel = response.body!;
      });
    }
  }

  Column ajusteMedida(String text, TextEditingController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        NumberInputWithIncrementDecrement(
          controller: controller,
          width: MediaQuery.of(context).size.width * .15,
          height: 40,
        ),
      ],
    );
  }

  Future<bool> _adicionarMedida() async {
    var viewModel = MedidaAdicionarViewModel(
        pacienteId: "6b08f77f-e158-41d6-ae4d-0471ca15d8b6",
        medida: MedidaViewModel(
          id: const Uuid().v4(),
          descricao: "Medida ${DateTime.now()}",
          data: DateTime.now().toString(),
          pesoAtual: double.parse(controllerPesoAtual.text),
          pesoIdeal: double.parse(controllerPesoIdeal.text),
          altura: double.parse(controllerAltura.text),
          circunferencia: CircunferenciaViewModel(
            bracoRelaxadoDireito:
                double.parse(controllerBracoRelaxadoDireito.text),
            bracoRelaxadoEsquerdo:
                double.parse(controllerBracoRelaxadoEsquerdo.text),
            bracoContraidoDireito:
                double.parse(controllerBracoContraidoDireito.text),
            bracoContraidoEsquerdo:
                double.parse(controllerBracoContraidoEsquerdo.text),
            antebracoDireito: double.parse(controllerAntebracoDireito.text),
            antebracoEsquerdo: double.parse(controllerAntebracoEsquerdo.text),
            punhoDireito: double.parse(controllerPunhoDireito.text),
            punhoEsquerdo: double.parse(controllerPunhoEsquerdo.text),
            pescoco: double.parse(controllerPescoco.text),
            ombro: double.parse(controllerOmbro.text),
            peitoral: double.parse(controllerPeitoral.text),
            cintura: double.parse(controllerCintura.text),
            abdomen: double.parse(controllerAbdomen.text),
            quadril: double.parse(controllerQuadril.text),
            panturrilhaDireita: double.parse(controllerPanturrilhaDireita.text),
            panturrilhaEsquerda:
                double.parse(controllerPanturrilhaEsquerda.text),
            coxaDireita: double.parse(controllerCoxaDireita.text),
            coxaEsquerda: double.parse(controllerCoxaEsquerda.text),
            coxaProximalDireita: double.parse(controllerCoxaDireita.text),
            coxaProximalEsquerda:
                double.parse(controllerCoxaProximalEsquerda.text),
          ),
        ));

    var response = await pacienteService.adicionarMedida(
        medidaAdicionarViewModel: viewModel,
        token:
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkdpdmFnbzEyIiwiZW1haWwiOiJudXRyaUB0ZXN0ZS5jb20iLCJwcmltYXJ5c2lkIjoiNmNlODY1MjYtNmEyNy00NzAzLWE0YWUtNTBkN2I1MGI4YTdhIiwicm9sZSI6Ik51dHJpY2lvbmlzdGEiLCJuYmYiOjE2NjIxMjk2OTksImV4cCI6MTY2MjEzNjgyNSwiaWF0IjoxNjYyMTI5Njk5fQ.aLUuqBK7HPrwARGSsqNl_oMBIxJ4u65WDhsC9JbeM5A");

    return ErrorService.alertErrors(context, response.error);
  }

  AlertDialog ajustaMedidasAlert() {
    return AlertDialog(
      title: const Center(child: Text('Adicionar Medida')),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ajusteMedida("Peso Atual", controllerPesoAtual),
                    const SizedBox(width: 15),
                    ajusteMedida("Peso Ideal", controllerPesoIdeal),
                    const SizedBox(width: 15),
                    ajusteMedida("Altura", controllerAltura),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ajusteMedida("Braco Relaxado Direito",
                        controllerBracoRelaxadoDireito),
                    const SizedBox(width: 15),
                    ajusteMedida("Braco Relaxado Esquerdo",
                        controllerBracoRelaxadoEsquerdo),
                    const SizedBox(width: 15),
                    ajusteMedida("Braco Contraido Direito",
                        controllerBracoContraidoDireito),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ajusteMedida("Braco Contraido Esquerdo",
                        controllerBracoContraidoEsquerdo),
                    const SizedBox(width: 15),
                    ajusteMedida(
                        "Antebraco Direito", controllerAntebracoDireito),
                    const SizedBox(width: 15),
                    ajusteMedida(
                        "Antebraco Esquerdo", controllerAntebracoEsquerdo),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ajusteMedida("Punho Direito", controllerPunhoDireito),
                    const SizedBox(width: 15),
                    ajusteMedida("Punho Esquerdo", controllerPunhoEsquerdo),
                    const SizedBox(width: 15),
                    ajusteMedida("Pescoco", controllerPescoco),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ajusteMedida("Ombro", controllerOmbro),
                    const SizedBox(width: 15),
                    ajusteMedida("Peitoral", controllerPeitoral),
                    const SizedBox(width: 15),
                    ajusteMedida("Cintura", controllerCintura),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ajusteMedida("Abdomen", controllerAbdomen),
                    const SizedBox(width: 15),
                    ajusteMedida("Quadril", controllerQuadril),
                    const SizedBox(width: 15),
                    ajusteMedida(
                        "Panturrilha Direita", controllerPanturrilhaDireita),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ajusteMedida(
                        "Panturrilha Esquerda", controllerPanturrilhaEsquerda),
                    const SizedBox(width: 15),
                    ajusteMedida("Coxa Direita", controllerCoxaDireita),
                    const SizedBox(width: 15),
                    ajusteMedida("Coxa Esquerda", controllerCoxaEsquerda),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ajusteMedida(
                        "Coxa Proximal Direita", controllerCoxaProximalDireita),
                    const SizedBox(width: 15),
                    ajusteMedida("Coxa Proximal Esquerda",
                        controllerCoxaProximalEsquerda),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async => {
            if (await _adicionarMedida() == false)
              {
                _load(),
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
          builder: (BuildContext context) => ajustaMedidasAlert(),
        ),
        child: const Text("Adicionar Medida"),
      ),
    );
  }

  Widget medidaRow(MedidaViewModel medida) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtil.blue,
          minimumSize: const Size(double.infinity, 55),
        ),
        onPressed: () {
          print(medida.id);
        },
        child: Text(medida.descricao!),
      ),
    );
  }

  Widget medidas() {
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
                  for (var medida in medidasViewModel) medidaRow(medida)
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
                    child: medidas(),
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

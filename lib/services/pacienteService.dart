import 'package:chopper/chopper.dart';
import 'package:nutri/converter/jsonSerializableConverter.dart';
import 'package:nutri/models/alimento/alimentoViewModel.dart';
import 'package:nutri/models/circuferencia/circunferenciaViewModel.dart';
import 'package:nutri/models/medida/medidaAdicionarViewModel.dart';
import 'package:nutri/models/medida/medidaAtualizarViewModel.dart';
import 'package:nutri/models/medida/medidaViewModel.dart';
import 'package:nutri/models/paciente/pacienteAdicionarViewModel.dart';
import 'package:nutri/models/paciente/pacienteAtualizarPlanoAlimentarViewModel.dart';
import 'package:nutri/models/paciente/pacienteAtualizarViewModel.dart';
import 'package:nutri/models/paciente/pacientePlanoAlimentarViewModel.dart';
import 'package:nutri/models/paciente/pacienteViewModel.dart';
import 'package:nutri/models/planoAlimentar/planoAlimentarViewModel.dart';
import 'package:nutri/models/refeicao/refeicaoViewModel.dart';
import 'package:nutri/utils/appSettings.dart';

part 'pacienteService.chopper.dart';

@ChopperApi(baseUrl: 'Paciente')
abstract class PacienteService extends ChopperService {
  @Get(path: '/{id}')
  Future<Response<PacienteViewModel>> getById(
      {@Path() required String id,
      @Header("Authorization") required String token});

  @Post()
  Future<Response<PacienteViewModel>> adicionar(
      {@Body() required PacienteAdicionarViewModel pacienteAdicionarViewModel,
      @Header("Authorization") required String token});

  @Delete(path: '/{id}')
  Future<void> delete(
      {@Query() required String id,
      @Header("Authorization") required String token});

  @Get(path: '/GetMedidas/{id}')
  Future<Response<List<MedidaViewModel>>> getMedidasById(
      {@Path() required String id,
      @Header("Authorization") required String token});

  @Post(path: '/AdicionarMedida')
  Future<Response<MedidaAdicionarViewModel>> adicionarMedida(
      {@Body() required MedidaAdicionarViewModel medidaAdicionarViewModel,
      @Header("Authorization") required String token});

  @Put()
  Future<Response<PacienteAtualizarViewModel>> atualizar(
      {@Body() required PacienteAtualizarViewModel pacienteAtualizarViewModel,
      @Header("Authorization") required String token});

  @Put(path: '/AtualizarMedida')
  Future<Response<MedidaAtualizarViewModel>> atualizarMedida(
      {@Body() required MedidaAtualizarViewModel medidaAtualizarViewModel,
      @Header("Authorization") required String token});

  @Get(path: '/GetPlanosAlimentares/{id}')
  Future<Response<List<PlanoAlimentarViewModel>>> getPlanosAlimentaresById(
      {@Path() required String id,
      @Header("Authorization") required String token});

  @Post(path: '/AdicionarPlanoAlimentar')
  Future<Response<PacientePlanoAlimentarViewModel>> adicionarPlanoAlimentar(
      {@Body() required PacientePlanoAlimentarViewModel pacienteViewModel,
      @Header("Authorization") required String token});

  @Patch(path: '/AtualizarPlanoAlimentar')
  Future<Response<PacienteAtualizarPlanoAlimentarViewModel>>
      atualizarPlanoAlimentar(
          {@Body()
              required PacienteAtualizarPlanoAlimentarViewModel
                  pacienteAtualizarPlanoAlimentarViewModel,
          @Header("Authorization")
              required String token});

  static PacienteService create() {
    const converter = JsonSerializableConverter({
      PacienteViewModel: PacienteViewModel.fromJsonFactory,
      PacienteAdicionarViewModel: PacienteAdicionarViewModel.fromJsonFactory,
      PacientePlanoAlimentarViewModel:
          PacientePlanoAlimentarViewModel.fromJson,
      PacienteAtualizarPlanoAlimentarViewModel:
          PacienteAtualizarPlanoAlimentarViewModel.fromJsonFactory,
      PacienteAtualizarViewModel: PacienteAtualizarViewModel.fromJsonFactory,
      MedidaViewModel: MedidaViewModel.fromJson,
      MedidaAtualizarViewModel: MedidaAtualizarViewModel.fromJsonFactory,
      MedidaAdicionarViewModel: MedidaAdicionarViewModel.fromJsonFactory,
      PlanoAlimentarViewModel: PlanoAlimentarViewModel.fromJson,
      RefeicaoViewModel: RefeicaoViewModel.fromJson,
      AlimentoViewModel: AlimentoViewModel.fromJson,
      CircunferenciaViewModel: CircunferenciaViewModel.fromJson
    });

    final client = ChopperClient(
      baseUrl: appSettings.baseUrl,
      services: [
        _$PacienteService(),
      ],
      converter: converter,
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$PacienteService(client);
  }
}

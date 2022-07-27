import 'package:chopper/chopper.dart';
import 'package:nutri/converter/jsonSerializableConverter.dart';
import 'package:nutri/models/medida/medidaAdicionarViewModel.dart';
import 'package:nutri/models/medida/medidaAtualizarViewModel.dart';
import 'package:nutri/models/paciente/pacienteAdicionarViewModel.dart';
import 'package:nutri/models/paciente/pacienteAtualizarPlanoAlimentarViewModel.dart';
import 'package:nutri/models/paciente/pacienteAtualizarViewModel.dart';
import 'package:nutri/models/paciente/pacientePlanoAlimentarViewModel.dart';
import 'package:nutri/models/paciente/pacienteViewModel.dart';
import 'package:nutri/utils/appSettings.dart';

part 'pacienteService.chopper.dart';

@ChopperApi(baseUrl: 'Paciente')
abstract class PacienteService extends ChopperService {
  @Get(path: '/{id}')
  Future<Response<PacienteViewModel>> getById({@Query() required String id});

  @Post()
  Future<Response<PacienteViewModel>> adicionar(
    @Body() PacienteAdicionarViewModel pacienteAdicionarViewModel,
  );

  @Post(path: '/AdicionarPlanoAlimentar')
  Future<Response<PacientePlanoAlimentarViewModel>> adicionarPlanoAlimentar(
    @Body() PacientePlanoAlimentarViewModel pacientePlanoAlimentarViewModel,
  );

  @Post(path: '/AdicionarMedida')
  Future<Response<MedidaAdicionarViewModel>> adicionarMedida(
    @Body() MedidaAdicionarViewModel medidaAdicionarViewModel,
  );

  @Delete(path: '/{id}')
  Future<void> delete({@Query() required String id});

  @Put()
  Future<Response<PacienteAtualizarViewModel>> atualizar(
    @Body() PacienteAtualizarViewModel pacienteAtualizarViewModel,
  );

  @Put(path: '/AtualizarMedida')
  Future<Response<MedidaAtualizarViewModel>> atualizarMedida(
    @Body() MedidaAtualizarViewModel medidaAtualizarViewModel,
  );

  @Patch(path: '/AtualizarPlanoAlimentar')
  Future<Response<PacienteAtualizarPlanoAlimentarViewModel>>
      atualizarPlanoAlimentar(
    @Body()
        PacienteAtualizarPlanoAlimentarViewModel
            pacienteAtualizarPlanoAlimentarViewModel,
  );

  static PacienteService create() {
    const converter = JsonSerializableConverter({
      PacienteViewModel: PacienteViewModel.fromJsonFactory,
      PacienteAdicionarViewModel: PacienteAdicionarViewModel.fromJsonFactory,
      PacientePlanoAlimentarViewModel:
          PacientePlanoAlimentarViewModel.fromJsonFactory,
      PacienteAtualizarPlanoAlimentarViewModel:
          PacienteAtualizarPlanoAlimentarViewModel.fromJsonFactory,
      PacienteAtualizarViewModel: PacienteAtualizarViewModel.fromJsonFactory,
      MedidaAtualizarViewModel: MedidaAtualizarViewModel.fromJsonFactory,
      MedidaAdicionarViewModel: MedidaAdicionarViewModel.fromJsonFactory,
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

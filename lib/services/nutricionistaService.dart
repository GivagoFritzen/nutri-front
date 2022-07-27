import 'package:chopper/chopper.dart';
import 'package:nutri/models/nutricionista/nutricionistaAdicionarViewModel.dart';
import 'package:nutri/models/nutricionista/nutricionistaAtualizarViewModel.dart';
import 'package:nutri/models/nutricionista/nutricionistaDesvincularOuVincularViewModel.dart';
import 'package:nutri/utils/appSettings.dart';
import 'package:nutri/converter/jsonSerializableConverter.dart';
import 'package:nutri/models/nutricionista/nutricionistaViewModel.dart';
import 'package:nutri/models/paciente/pacienteSimplificadoViewModel.dart';

part 'nutricionistaService.chopper.dart';

@ChopperApi(baseUrl: 'Nutricionista')
abstract class NutricionistaService extends ChopperService {
  @Get(path: '/{id}')
  Future<Response<NutricionistaViewModel>> getById(
      {@Query() required String id});

  @Get(path: '/GetAll')
  Future<Response<List<NutricionistaViewModel>>> getAll();

  @Get(path: '/GetPacientes')
  Future<Response<List<PacienteSimplificadoViewModel>>> getPacientes(
      {@Query() required String id});

  @Delete(path: '/{id}')
  Future<void> delete({@Query() required String id});

  @Post()
  Future<Response<NutricionistaAdicionarViewModel>> adicionar(
    @Body() NutricionistaAdicionarViewModel nutricionistaAdicionarViewModel,
  );

  @Put()
  Future<Response<NutricionistaAtualizarViewModel>> atualizar(
    @Body() NutricionistaAtualizarViewModel nutricionistaAtualizarViewModel,
  );

  @Patch(path: '/VincularPaciente')
  Future<Response<NutricionistaDesvincularOuVincularViewModel>> vincular(
    @Body()
        NutricionistaDesvincularOuVincularViewModel
            nutricionistaDesvincularOuVincularViewModel,
  );

  @Patch(path: '/DesvincularPaciente')
  Future<Response<NutricionistaDesvincularOuVincularViewModel>> desvincular(
      {@Query() required String pacienteId});

  static NutricionistaService create() {
    const converter = JsonSerializableConverter({
      PacienteSimplificadoViewModel:
          PacienteSimplificadoViewModel.fromJsonFactory,
      NutricionistaViewModel: NutricionistaViewModel.fromJsonFactory,
      NutricionistaAdicionarViewModel:
          NutricionistaAdicionarViewModel.fromJsonFactory,
      NutricionistaAtualizarViewModel:
          NutricionistaAtualizarViewModel.fromJsonFactory,
      NutricionistaDesvincularOuVincularViewModel:
          NutricionistaDesvincularOuVincularViewModel.fromJsonFactory,
    });

    final client = ChopperClient(
      baseUrl: appSettings.baseUrl,
      services: [
        _$NutricionistaService(),
      ],
      converter: converter,
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$NutricionistaService(client);
  }
}

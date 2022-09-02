import 'package:chopper/chopper.dart';
import 'package:nutri/converter/jsonSerializableConverter.dart';
import 'package:nutri/models/nutricionista/nutricionistaAdicionarViewModel.dart';
import 'package:nutri/models/nutricionista/nutricionistaAtualizarViewModel.dart';
import 'package:nutri/models/nutricionista/nutricionistaDesvincularOuVincularViewModel.dart';
import 'package:nutri/models/nutricionista/nutricionistaViewModel.dart';
import 'package:nutri/models/paciente/pacienteSimplificadoViewModel.dart';
import 'package:nutri/utils/appSettings.dart';

part 'nutricionistaService.chopper.dart';

@ChopperApi(baseUrl: 'Nutricionista')
abstract class NutricionistaService extends ChopperService {
  @Get(path: '/{id}')
  Future<Response<NutricionistaViewModel>> getById(
      {@Path() required String id,
      @Header("Authorization") required String token});

  @Get(path: '/GetAll')
  Future<Response<List<NutricionistaViewModel>>> getAll(
      {@Header("Authorization") required String token});

  @Get(path: '/GetPacientes')
  Future<Response<List<PacienteSimplificadoViewModel>>> getPacientes(
      {@Query() required String id,
      @Header("Authorization") required String token});

  @Delete(path: '/{id}')
  Future<void> delete(
      {@Query() required String id,
      @Header("Authorization") required String token});

  @Post()
  Future<Response<NutricionistaAdicionarViewModel>> adicionar({
    @Header("Authorization") required String token,
    @Body() required NutricionistaAdicionarViewModel nutricionistaAdicionarViewModel,
  });

  @Put()
  Future<Response<NutricionistaAtualizarViewModel>> atualizar(
      {@Header("Authorization")
          required String token,
      @Body()
          required NutricionistaAtualizarViewModel
              nutricionistaAtualizarViewModel});

  @Patch(path: '/VincularPaciente')
  Future<Response<NutricionistaDesvincularOuVincularViewModel>> vincular({
    @Header("Authorization") required String token,
    @Body() required
        NutricionistaDesvincularOuVincularViewModel
            nutricionistaDesvincularOuVincularViewModel,
  });

  @Patch(path: '/DesvincularPaciente')
  Future<Response<NutricionistaDesvincularOuVincularViewModel>> desvincular(
      {@Header("Authorization") required String token,
      @Query() required String paciente});

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
        CurlInterceptor(),
      ],
    );
    return _$NutricionistaService(client);
  }
}

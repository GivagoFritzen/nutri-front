import 'package:chopper/chopper.dart';
import 'package:nutri/converter/jsonSerializableConverter.dart';
import 'package:nutri/utils/appSettings.dart';
import 'package:nutri/models/taco/tacoPaginationViewModel.dart';

part 'tacoService.chopper.dart';

@ChopperApi(baseUrl: 'Taco')
abstract class TacoService extends ChopperService {
  @Get()
  Future<Response<TacoPaginationViewModel>> getTacoByPagination(
      {@Query() required String descricao,
      @Query() required int paginaAtual,
      @Query() required int tamanhoPagina});

  static TacoService create() {
    const converter = JsonSerializableConverter({
      TacoPaginationViewModel: TacoPaginationViewModel.fromJsonFactory,
    });

    final client = ChopperClient(
      baseUrl: appSettings.baseUrl,
      services: [
        _$TacoService(),
      ],
      converter: converter,
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$TacoService(client);
  }
}

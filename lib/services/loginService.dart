import 'package:chopper/chopper.dart';
import 'package:nutri/converter/jsonSerializableConverter.dart';
import 'package:nutri/models/login/loginNutricionistaViewModel.dart';
import 'package:nutri/models/login/loginTokenViewModel.dart';
import 'package:nutri/utils/appSettings.dart';

part 'loginService.chopper.dart';

@ChopperApi(baseUrl: 'Login')
abstract class LoginService extends ChopperService {
  @Post()
  Future<Response<LoginTokenViewModel>> login(
    @Body() LoginNutricionistaViewModel login,
  );

  @Patch()
  Future<Response<LoginTokenViewModel>> refreshToken(
    @Body() LoginTokenViewModel loginToken,
  );

  static LoginService create() {
    const converter = JsonSerializableConverter({
      LoginTokenViewModel: LoginTokenViewModel.fromJsonFactory,
    });

    final client = ChopperClient(
      baseUrl: appSettings.baseUrl,
      services: [
        _$LoginService(),
      ],
      converter: converter,
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$LoginService(client);
  }
}

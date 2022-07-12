import 'package:chopper/chopper.dart';
import 'package:nutri/utils/appSettings.dart';

import '../models/login/loginNutricionistaViewModel.dart';
import '../models/login/loginTokenViewModel.dart';

part 'loginService.chopper.dart';

@ChopperApi(baseUrl: 'Login')
abstract class LoginService extends ChopperService {
  @Post()
  Future<Response<LoginTokenViewModel>> login(
    @Body() LoginNutricionistaViewModel login,
  );

  @Post()
  Future<Response<LoginTokenViewModel>> refreshToken(
    @Body() LoginTokenViewModel loginToken,
  );

  static LoginService create() {
    final client = ChopperClient(
      baseUrl: appSettings.baseUrl,
      services: [
        _$LoginService(),
      ],
      converter: JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$LoginService(client);
  }
}

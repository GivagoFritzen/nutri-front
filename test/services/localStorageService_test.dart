import 'package:flutter_test/flutter_test.dart';
import 'package:nutri/services/localStorageService.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Get value Local Storage empty', (WidgetTester tester) async {
    var localStorageService = LocalStorageService();
    localStorageService.prefs = await SharedPreferences.getInstance();

    localStorageService.readLocale();

    expect(localStorageService.local["refreshToken"], "");
  });


  testWidgets('Get and Set value in Local Storage', (WidgetTester tester) async {
    var localStorageService = LocalStorageService();
    localStorageService.prefs = await SharedPreferences.getInstance();

    var value = "123";
    await localStorageService.setString("refreshToken", value);
    localStorageService.readLocale();

    expect(localStorageService.local["refreshToken"], value);
  });

  testWidgets('Clean Local Storage', (WidgetTester tester) async {
    var localStorageService = LocalStorageService();
    localStorageService.prefs = await SharedPreferences.getInstance();

    var value = "123";
    await localStorageService.setString("refreshToken", value);
    localStorageService.clean();

    expect(localStorageService.local["refreshToken"], "");
  });
}

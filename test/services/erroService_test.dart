import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutri/models/erros/errorViewModel.dart';
import 'package:nutri/services/erroService.dart';

void main() {
  testWidgets('Alert Erro with response null', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Material(child: Container())));
    final BuildContext context = tester.element(find.byType(Container));

    expect(ErrorService.alertErrors(context, null), false);
  });

  testWidgets('Alert Erro with in the response', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Material(child: Container(child: Scaffold()))));
    final BuildContext context = tester.element(find.byType(Scaffold));

    var response = ErrorViewModel(error: "Erro");
    var responseJson = json.encode(response);

    expect(ErrorService.alertErrors(context, responseJson), true);
  });

  testWidgets('Alert Erros with messages in the response',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Material(child: Container(child: Scaffold()))));
    final BuildContext context = tester.element(find.byType(Scaffold));

    var body = <String, List<String>>{};
    body['Mensagens'] = ["Erro"];

    var response = ErrorViewModel(errors: body);
    var responseJson = json.encode(response);

    expect(ErrorService.alertErrors(context, responseJson), true);
  });

  testWidgets('Alert Erros with no messages in the response',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Material(child: Container(child: Scaffold()))));
    final BuildContext context = tester.element(find.byType(Scaffold));

    var body = <String, List<String>>{};
    body['erros'] = ['Erro'];

    var response = ErrorViewModel(errors: body);
    var responseJson = json.encode(response);

    expect(ErrorService.alertErrors(context, responseJson), true);
  });
}

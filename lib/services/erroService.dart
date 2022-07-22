import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nutri/components/alert.dart';
import 'package:nutri/models/erros/errorViewModel.dart';

class ErrorService {
  static bool alertErrors(BuildContext context, Object? response) {
    if (response != null) {
      var jsonString = response as String;
      Map<String, dynamic> d = json.decode(jsonString);
      ErrorViewModel errorViewModel = ErrorViewModel.fromJsonFactory(d);

      if (errorViewModel.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          Alert.message(errorViewModel.error.toString()),
        );

        return true;
      } else if (errorViewModel.errors != null) {
        for (var mensagem in errorViewModel.errors["Mensagens"]) {
          ScaffoldMessenger.of(context).showSnackBar(
            Alert.message(mensagem),
          );
        }

        return true;
      }
    }

    return false;
  }
}

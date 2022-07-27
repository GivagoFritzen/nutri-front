// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tacoService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TacoService extends TacoService {
  _$TacoService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TacoService;

  @override
  Future<Response<TacoPaginationViewModel>> getPacientes(
      {required String descricao,
      required String paginaAtual,
      required String tamanhoPagina}) {
    final $url = 'Taco';
    final $params = <String, dynamic>{
      'descricao': descricao,
      'paginaAtual': paginaAtual,
      'tamanhoPagina': tamanhoPagina
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<TacoPaginationViewModel, TacoPaginationViewModel>($request);
  }
}

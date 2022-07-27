// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutricionistaService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$NutricionistaService extends NutricionistaService {
  _$NutricionistaService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NutricionistaService;

  @override
  Future<Response<NutricionistaViewModel>> getById({required String id}) {
    final $url = 'Nutricionista/{id}';
    final $params = <String, dynamic>{'id': id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<NutricionistaViewModel, NutricionistaViewModel>($request);
  }

  @override
  Future<Response<List<NutricionistaViewModel>>> getAll() {
    final $url = 'Nutricionista/GetAll';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<List<NutricionistaViewModel>, NutricionistaViewModel>($request);
  }

  @override
  Future<Response<List<PacienteSimplificadoViewModel>>> getPacientes(
      {required String id}) {
    final $url = 'Nutricionista/GetPacientes';
    final $params = <String, dynamic>{'id': id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<PacienteSimplificadoViewModel>,
        PacienteSimplificadoViewModel>($request);
  }

  @override
  Future<void> delete({required String id}) {
    final $url = 'Nutricionista/{id}';
    final $params = <String, dynamic>{'id': id};
    final $request =
        Request('DELETE', $url, client.baseUrl, parameters: $params);
    return client.send($request);
  }

  @override
  Future<Response<NutricionistaAdicionarViewModel>> adicionar(
      NutricionistaAdicionarViewModel nutricionistaAdicionarViewModel) {
    final $url = 'Nutricionista';
    final $body = nutricionistaAdicionarViewModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<NutricionistaAdicionarViewModel,
        NutricionistaAdicionarViewModel>($request);
  }

  @override
  Future<Response<NutricionistaAtualizarViewModel>> atualizar(
      NutricionistaAtualizarViewModel nutricionistaAtualizarViewModel) {
    final $url = 'Nutricionista';
    final $body = nutricionistaAtualizarViewModel;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<NutricionistaAtualizarViewModel,
        NutricionistaAtualizarViewModel>($request);
  }

  @override
  Future<Response<NutricionistaDesvincularOuVincularViewModel>> vincular(
      NutricionistaDesvincularOuVincularViewModel
          nutricionistaDesvincularOuVincularViewModel) {
    final $url = 'Nutricionista/VincularPaciente';
    final $body = nutricionistaDesvincularOuVincularViewModel;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<NutricionistaDesvincularOuVincularViewModel,
        NutricionistaDesvincularOuVincularViewModel>($request);
  }

  @override
  Future<Response<NutricionistaDesvincularOuVincularViewModel>> desvincular(
      {required String pacienteId}) {
    final $url = 'Nutricionista/DesvincularPaciente';
    final $params = <String, dynamic>{'pacienteId': pacienteId};
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<NutricionistaDesvincularOuVincularViewModel,
        NutricionistaDesvincularOuVincularViewModel>($request);
  }
}

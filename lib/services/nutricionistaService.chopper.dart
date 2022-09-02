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
  Future<Response<NutricionistaViewModel>> getById(
      {required String id, required String token}) {
    final $url = 'Nutricionista/${id}';
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<NutricionistaViewModel, NutricionistaViewModel>($request);
  }

  @override
  Future<Response<List<NutricionistaViewModel>>> getAll(
      {required String token}) {
    final $url = 'Nutricionista/GetAll';
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<List<NutricionistaViewModel>, NutricionistaViewModel>($request);
  }

  @override
  Future<Response<List<PacienteSimplificadoViewModel>>> getPacientes(
      {required String id, required String token}) {
    final $url = 'Nutricionista/GetPacientes';
    final $params = <String, dynamic>{'id': id};
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<List<PacienteSimplificadoViewModel>,
        PacienteSimplificadoViewModel>($request);
  }

  @override
  Future<void> delete({required String id, required String token}) {
    final $url = 'Nutricionista/{id}';
    final $params = <String, dynamic>{'id': id};
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('DELETE', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send($request);
  }

  @override
  Future<Response<NutricionistaAdicionarViewModel>> adicionar(
      {required String token,
      required NutricionistaAdicionarViewModel
          nutricionistaAdicionarViewModel}) {
    final $url = 'Nutricionista';
    final $headers = {
      'Authorization': token,
    };

    final $body = nutricionistaAdicionarViewModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<NutricionistaAdicionarViewModel,
        NutricionistaAdicionarViewModel>($request);
  }

  @override
  Future<Response<NutricionistaAtualizarViewModel>> atualizar(
      {required String token,
      required NutricionistaAtualizarViewModel
          nutricionistaAtualizarViewModel}) {
    final $url = 'Nutricionista';
    final $headers = {
      'Authorization': token,
    };

    final $body = nutricionistaAtualizarViewModel;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<NutricionistaAtualizarViewModel,
        NutricionistaAtualizarViewModel>($request);
  }

  @override
  Future<Response<NutricionistaDesvincularOuVincularViewModel>> vincular(
      {required String token,
      required NutricionistaDesvincularOuVincularViewModel
          nutricionistaDesvincularOuVincularViewModel}) {
    final $url = 'Nutricionista/VincularPaciente';
    final $headers = {
      'Authorization': token,
    };

    final $body = nutricionistaDesvincularOuVincularViewModel;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<NutricionistaDesvincularOuVincularViewModel,
        NutricionistaDesvincularOuVincularViewModel>($request);
  }

  @override
  Future<Response<NutricionistaDesvincularOuVincularViewModel>> desvincular(
      {required String token, required String paciente}) {
    final $url = 'Nutricionista/DesvincularPaciente';
    final $params = <String, dynamic>{'paciente': paciente};
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('PATCH', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<NutricionistaDesvincularOuVincularViewModel,
        NutricionistaDesvincularOuVincularViewModel>($request);
  }
}

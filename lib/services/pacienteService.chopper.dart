// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacienteService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$PacienteService extends PacienteService {
  _$PacienteService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PacienteService;

  @override
  Future<Response<PacienteViewModel>> getById(
      {required String id, required String token}) {
    final $url = 'Paciente/${id}';
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<PacienteViewModel, PacienteViewModel>($request);
  }

  @override
  Future<Response<PacienteViewModel>> adicionar(
      {required PacienteAdicionarViewModel pacienteAdicionarViewModel,
      required String token}) {
    final $url = 'Paciente';
    final $headers = {
      'Authorization': token,
    };

    final $body = pacienteAdicionarViewModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<PacienteViewModel, PacienteViewModel>($request);
  }

  @override
  Future<void> delete({required String id, required String token}) {
    final $url = 'Paciente/{id}';
    final $params = <String, dynamic>{'id': id};
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('DELETE', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send($request);
  }

  @override
  Future<Response<List<MedidaViewModel>>> getMedidasById(
      {required String id, required String token}) {
    final $url = 'Paciente/GetMedidas/${id}';
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<MedidaViewModel>, MedidaViewModel>($request);
  }

  @override
  Future<Response<MedidaAdicionarViewModel>> adicionarMedida(
      {required MedidaAdicionarViewModel medidaAdicionarViewModel,
      required String token}) {
    final $url = 'Paciente/AdicionarMedida';
    final $headers = {
      'Authorization': token,
    };

    final $body = medidaAdicionarViewModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<MedidaAdicionarViewModel, MedidaAdicionarViewModel>($request);
  }

  @override
  Future<Response<PacienteAtualizarViewModel>> atualizar(
      {required PacienteAtualizarViewModel pacienteAtualizarViewModel,
      required String token}) {
    final $url = 'Paciente';
    final $headers = {
      'Authorization': token,
    };

    final $body = pacienteAtualizarViewModel;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<PacienteAtualizarViewModel, PacienteAtualizarViewModel>($request);
  }

  @override
  Future<Response<MedidaAtualizarViewModel>> atualizarMedida(
      {required MedidaAtualizarViewModel medidaAtualizarViewModel,
      required String token}) {
    final $url = 'Paciente/AtualizarMedida';
    final $headers = {
      'Authorization': token,
    };

    final $body = medidaAtualizarViewModel;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<MedidaAtualizarViewModel, MedidaAtualizarViewModel>($request);
  }

  @override
  Future<Response<List<PlanoAlimentarViewModel>>> getPlanosAlimentaresById(
      {required String id, required String token}) {
    final $url = 'Paciente/GetPlanosAlimentares/${id}';
    final $headers = {
      'Authorization': token,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<List<PlanoAlimentarViewModel>, PlanoAlimentarViewModel>($request);
  }

  @override
  Future<Response<PacientePlanoAlimentarViewModel>> adicionarPlanoAlimentar(
      {required PacientePlanoAlimentarViewModel pacienteViewModel,
      required String token}) {
    final $url = 'Paciente/AdicionarPlanoAlimentar';
    final $headers = {
      'Authorization': token,
    };

    final $body = pacienteViewModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<PacientePlanoAlimentarViewModel,
        PacientePlanoAlimentarViewModel>($request);
  }

  @override
  Future<Response<PacienteAtualizarPlanoAlimentarViewModel>>
      atualizarPlanoAlimentar(
          {required PacienteAtualizarPlanoAlimentarViewModel
              pacienteAtualizarPlanoAlimentarViewModel,
          required String token}) {
    final $url = 'Paciente/AtualizarPlanoAlimentar';
    final $headers = {
      'Authorization': token,
    };

    final $body = pacienteAtualizarPlanoAlimentarViewModel;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<PacienteAtualizarPlanoAlimentarViewModel,
        PacienteAtualizarPlanoAlimentarViewModel>($request);
  }
}

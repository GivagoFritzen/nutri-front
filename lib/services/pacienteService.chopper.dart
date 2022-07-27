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
  Future<Response<PacienteViewModel>> getById({required String id}) {
    final $url = 'Paciente/{id}';
    final $params = <String, dynamic>{'id': id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PacienteViewModel, PacienteViewModel>($request);
  }

  @override
  Future<Response<PacienteViewModel>> adicionar(
      PacienteAdicionarViewModel pacienteAdicionarViewModel) {
    final $url = 'Paciente';
    final $body = pacienteAdicionarViewModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<PacienteViewModel, PacienteViewModel>($request);
  }

  @override
  Future<Response<PacientePlanoAlimentarViewModel>> adicionarPlanoAlimentar(
      PacientePlanoAlimentarViewModel pacientePlanoAlimentarViewModel) {
    final $url = 'Paciente/AdicionarPlanoAlimentar';
    final $body = pacientePlanoAlimentarViewModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<PacientePlanoAlimentarViewModel,
        PacientePlanoAlimentarViewModel>($request);
  }

  @override
  Future<Response<MedidaAdicionarViewModel>> adicionarMedida(
      MedidaAdicionarViewModel medidaAdicionarViewModel) {
    final $url = 'Paciente/AdicionarMedida';
    final $body = medidaAdicionarViewModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<MedidaAdicionarViewModel, MedidaAdicionarViewModel>($request);
  }

  @override
  Future<void> delete({required String id}) {
    final $url = 'Paciente/{id}';
    final $params = <String, dynamic>{'id': id};
    final $request =
        Request('DELETE', $url, client.baseUrl, parameters: $params);
    return client.send($request);
  }

  @override
  Future<Response<PacienteAtualizarViewModel>> atualizar(
      PacienteAtualizarViewModel pacienteAtualizarViewModel) {
    final $url = 'Paciente';
    final $body = pacienteAtualizarViewModel;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client
        .send<PacienteAtualizarViewModel, PacienteAtualizarViewModel>($request);
  }

  @override
  Future<Response<MedidaAtualizarViewModel>> atualizarMedida(
      MedidaAtualizarViewModel medidaAtualizarViewModel) {
    final $url = 'Paciente/AtualizarMedida';
    final $body = medidaAtualizarViewModel;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client
        .send<MedidaAtualizarViewModel, MedidaAtualizarViewModel>($request);
  }

  @override
  Future<Response<PacienteAtualizarPlanoAlimentarViewModel>>
      atualizarPlanoAlimentar(
          PacienteAtualizarPlanoAlimentarViewModel
              pacienteAtualizarPlanoAlimentarViewModel) {
    final $url = 'Paciente/AtualizarPlanoAlimentar';
    final $body = pacienteAtualizarPlanoAlimentarViewModel;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<PacienteAtualizarPlanoAlimentarViewModel,
        PacienteAtualizarPlanoAlimentarViewModel>($request);
  }
}

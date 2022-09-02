import 'package:json_annotation/json_annotation.dart';

part 'circunferenciaViewModel.g.dart';

@JsonSerializable()
class CircunferenciaViewModel {
  double? bracoRelaxadoDireito;
  double? bracoRelaxadoEsquerdo;
  double? bracoContraidoDireito;
  double? bracoContraidoEsquerdo;
  double? antebracoDireito;
  double? antebracoEsquerdo;
  double? punhoDireito;
  double? punhoEsquerdo;
  double? pescoco;
  double? ombro;
  double? peitoral;
  double? cintura;
  double? abdomen;
  double? quadril;
  double? panturrilhaDireita;
  double? panturrilhaEsquerda;
  double? coxaDireita;
  double? coxaEsquerda;
  double? coxaProximalDireita;
  double? coxaProximalEsquerda;

  CircunferenciaViewModel(
      {this.bracoRelaxadoDireito,
      this.bracoRelaxadoEsquerdo,
      this.bracoContraidoDireito,
      this.bracoContraidoEsquerdo,
      this.antebracoDireito,
      this.antebracoEsquerdo,
      this.punhoDireito,
      this.punhoEsquerdo,
      this.pescoco,
      this.ombro,
      this.peitoral,
      this.cintura,
      this.abdomen,
      this.quadril,
      this.panturrilhaDireita,
      this.panturrilhaEsquerda,
      this.coxaDireita,
      this.coxaEsquerda,
      this.coxaProximalDireita,
      this.coxaProximalEsquerda});

  static const fromJson = _$CircunferenciaViewModelFromJson;

  Map<String, dynamic> toJson() => _$CircunferenciaViewModelToJson(this);
}

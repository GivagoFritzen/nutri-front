class CircunferenciaViewModel {
  int? bracoRelaxadoDireito;
  int? bracoRelaxadoEsquerdo;
  int? bracoContraidoDireito;
  int? bracoContraidoEsquerdo;
  int? antebracoDireito;
  int? antebracoEsquerdo;
  int? punhoDireito;
  int? punhoEsquerdo;
  int? pescoco;
  int? ombro;
  int? peitoral;
  int? cintura;
  int? abdomen;
  int? quadril;
  int? panturrilhaDireita;
  int? panturrilhaEsquerda;
  int? coxaDireita;
  int? coxaEsquerda;
  int? coxaProximalDireita;
  int? coxaProximalEsquerda;

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

  CircunferenciaViewModel.fromJson(Map<String, dynamic> json) {
    bracoRelaxadoDireito = json['bracoRelaxadoDireito'];
    bracoRelaxadoEsquerdo = json['bracoRelaxadoEsquerdo'];
    bracoContraidoDireito = json['bracoContraidoDireito'];
    bracoContraidoEsquerdo = json['bracoContraidoEsquerdo'];
    antebracoDireito = json['antebracoDireito'];
    antebracoEsquerdo = json['antebracoEsquerdo'];
    punhoDireito = json['punhoDireito'];
    punhoEsquerdo = json['punhoEsquerdo'];
    pescoco = json['pescoco'];
    ombro = json['ombro'];
    peitoral = json['peitoral'];
    cintura = json['cintura'];
    abdomen = json['abdomen'];
    quadril = json['quadril'];
    panturrilhaDireita = json['panturrilhaDireita'];
    panturrilhaEsquerda = json['panturrilhaEsquerda'];
    coxaDireita = json['coxaDireita'];
    coxaEsquerda = json['coxaEsquerda'];
    coxaProximalDireita = json['coxaProximalDireita'];
    coxaProximalEsquerda = json['coxaProximalEsquerda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bracoRelaxadoDireito'] = this.bracoRelaxadoDireito;
    data['bracoRelaxadoEsquerdo'] = this.bracoRelaxadoEsquerdo;
    data['bracoContraidoDireito'] = this.bracoContraidoDireito;
    data['bracoContraidoEsquerdo'] = this.bracoContraidoEsquerdo;
    data['antebracoDireito'] = this.antebracoDireito;
    data['antebracoEsquerdo'] = this.antebracoEsquerdo;
    data['punhoDireito'] = this.punhoDireito;
    data['punhoEsquerdo'] = this.punhoEsquerdo;
    data['pescoco'] = this.pescoco;
    data['ombro'] = this.ombro;
    data['peitoral'] = this.peitoral;
    data['cintura'] = this.cintura;
    data['abdomen'] = this.abdomen;
    data['quadril'] = this.quadril;
    data['panturrilhaDireita'] = this.panturrilhaDireita;
    data['panturrilhaEsquerda'] = this.panturrilhaEsquerda;
    data['coxaDireita'] = this.coxaDireita;
    data['coxaEsquerda'] = this.coxaEsquerda;
    data['coxaProximalDireita'] = this.coxaProximalDireita;
    data['coxaProximalEsquerda'] = this.coxaProximalEsquerda;
    return data;
  }
}

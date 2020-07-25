class NumeroEmLedModel {
  NumeroEmLedModel(
      this.ledHorizontalUm,
      this.ledHorizontalDois,
      this.ledHorizontalTres,
      this.ledVerticalUm,
      this.ledVerticalDois,
      this.ledVerticalTres,
      this.ledVerticalQuatro);

  NumeroEmLedModel.numeroZero()
      : ledHorizontalUm = true,
        ledHorizontalDois = false,
        ledHorizontalTres = true,
        ledVerticalUm = true,
        ledVerticalDois = true,
        ledVerticalTres = true,
        ledVerticalQuatro = true;

  NumeroEmLedModel.numeroUm()
      : ledHorizontalUm = false,
        ledHorizontalDois = false,
        ledHorizontalTres = false,
        ledVerticalUm = false,
        ledVerticalDois = true,
        ledVerticalTres = false,
        ledVerticalQuatro = true;

  NumeroEmLedModel.numeroDois()
      : ledHorizontalUm = true,
        ledHorizontalDois = true,
        ledHorizontalTres = true,
        ledVerticalUm = false,
        ledVerticalDois = true,
        ledVerticalTres = true,
        ledVerticalQuatro = false;

  NumeroEmLedModel.numeroTres()
      : ledHorizontalUm = true,
        ledHorizontalDois = true,
        ledHorizontalTres = true,
        ledVerticalUm = false,
        ledVerticalDois = true,
        ledVerticalTres = false,
        ledVerticalQuatro = true;

  NumeroEmLedModel.numeroQuatro()
      : ledHorizontalUm = false,
        ledHorizontalDois = true,
        ledHorizontalTres = false,
        ledVerticalUm = true,
        ledVerticalDois = true,
        ledVerticalTres = false,
        ledVerticalQuatro = true;

  NumeroEmLedModel.numeroCinco()
      : ledHorizontalUm = true,
        ledHorizontalDois = true,
        ledHorizontalTres = true,
        ledVerticalUm = true,
        ledVerticalDois = false,
        ledVerticalTres = false,
        ledVerticalQuatro = true;

  NumeroEmLedModel.numeroSeis()
      : ledHorizontalUm = true,
        ledHorizontalDois = true,
        ledHorizontalTres = true,
        ledVerticalUm = true,
        ledVerticalDois = false,
        ledVerticalTres = true,
        ledVerticalQuatro = true;

  NumeroEmLedModel.numeroSete()
      : ledHorizontalUm = true,
        ledHorizontalDois = false,
        ledHorizontalTres = false,
        ledVerticalUm = false,
        ledVerticalDois = true,
        ledVerticalTres = false,
        ledVerticalQuatro = true;

  NumeroEmLedModel.numeroOito()
      : ledHorizontalUm = true,
        ledHorizontalDois = true,
        ledHorizontalTres = true,
        ledVerticalUm = true,
        ledVerticalDois = true,
        ledVerticalTres = true,
        ledVerticalQuatro = true;

  NumeroEmLedModel.numeroNove()
      : ledHorizontalUm = true,
        ledHorizontalDois = true,
        ledHorizontalTres = true,
        ledVerticalUm = true,
        ledVerticalDois = true,
        ledVerticalTres = false,
        ledVerticalQuatro = true;

  bool ledHorizontalUm;
  bool ledHorizontalDois;
  bool ledHorizontalTres;
  bool ledVerticalUm;
  bool ledVerticalDois;
  bool ledVerticalTres;
  bool ledVerticalQuatro;
}

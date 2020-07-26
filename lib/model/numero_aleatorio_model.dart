class NumeroAleatorioModel {
  int valor;

  NumeroAleatorioModel(
    this.valor,
  );

  NumeroAleatorioModel.fromJson(Map<String, dynamic> json)
      : valor = json['value'];
}

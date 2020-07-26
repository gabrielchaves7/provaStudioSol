class CustomHttpException implements Exception {
  String mensagem;
  int statusCode;
  CustomHttpException(this.mensagem, this.statusCode);
}

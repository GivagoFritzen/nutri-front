class PathNotFoundException implements Exception {
  final String message;

  PathNotFoundException([this.message = '']);
}

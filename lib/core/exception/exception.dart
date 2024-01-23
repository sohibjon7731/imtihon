// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerException implements Exception {
  final String message;
  final int code;

  ServerException({
     this.message = '',
     this.code = 0,
  });

  @override
  String toString() => 'ServerException(message: $message, code: $code)';
}

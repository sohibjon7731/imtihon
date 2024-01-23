// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather/core/exception/exception.dart';

sealed class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  final int code;
  ServerFailure({
    super.message = '',
    this.code = 140,
  });

  factory ServerFailure.fromServerException(ServerException exception) {
    return ServerFailure(
        message: exception.message,
        code: exception.code);
  }

  @override
  String toString() => 'ServerFailure(code: $code)';
}

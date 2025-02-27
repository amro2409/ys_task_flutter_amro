

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);
}

class DbException implements Exception {
  final String message;
  final int? statusCode;

  DbException(this.message, [this.statusCode]);
}

class ErrorResponse {
  late String statusMessage;
  late String? userMessage;
  late int? statusCode;
  late String? stackTrace;

  ErrorResponse({
    this.stackTrace,
    this.statusCode,
    this.statusMessage = "Something went wrong",
    this.userMessage,
  });
}
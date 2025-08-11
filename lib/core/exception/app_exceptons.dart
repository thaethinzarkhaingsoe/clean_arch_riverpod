/// Common application exceptions
class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});

  @override
  String toString() => 'AppException: $message';
}

/// Network-related exceptions
class NetworkException extends AppException {
  NetworkException(super.message);
}

/// Validation-related exceptions
class ValidationException extends AppException {
  ValidationException(super.message);
}

/// Authentication exceptions
class AuthException extends AppException {
  AuthException(super.message);
}

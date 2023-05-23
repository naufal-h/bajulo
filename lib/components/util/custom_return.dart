enum ReturnType { error, sucess }

class CustomReturn {
  final ReturnType returnType;
  final String message;
  final int returnCode;

  CustomReturn({
    required this.returnType,
    required this.message,
    this.returnCode = 0,
  });

  static CustomReturn unauthorizedError() {
    return CustomReturn(
      returnType: ReturnType.error,
      message: 'Unauthorized',
      returnCode: 401,
    );
  }

  static CustomReturn authSignUpError(String error) {
    Map<String, String> authErrors = {
      'EMAIL_EXISTS': 'E-mail already exists',
      'OPERATION_NOT_ALLOWED': 'Operation not allowed',
      'USER_DISABLED': 'User disabled',
      'INVALID_PASSWORD': 'Invalid password',
      'INVALID_EMAIL': 'Invalid e-mail',
      'EMAIL_NOT_FOUND': 'E-mail not found',
    };
    if (authErrors[error] == null) {
      return CustomReturn(
          returnType: ReturnType.error, message: 'Error: $error');
    } else {
      return CustomReturn(
          returnType: ReturnType.error, message: authErrors[error] ?? '');
    }
  }

  static CustomReturn sucess() {
    return CustomReturn(
      returnType: ReturnType.sucess,
      message: 'Success',
      returnCode: 0,
    );
  }
}

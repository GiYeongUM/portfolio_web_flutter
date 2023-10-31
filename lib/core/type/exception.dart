class NotFoundException implements Exception {
  NotFoundException({this.code, this.message});

  final String? code;
  final String? message;

  @override
  String toString() => message ?? '';
}

class UnSupportedException implements Exception {
  UnSupportedException({this.code, this.message});

  final String? code;
  final String? message;

  @override
  String toString() => message ?? '';
}

class LogicalException implements Exception {
  const LogicalException({this.code, this.message});

  final String? code;
  final String? message;

  @override
  String toString() => message ?? '';
}

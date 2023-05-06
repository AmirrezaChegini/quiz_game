class AppException implements Exception {
  final String _message;
  AppException(this._message);
  String get message => _message;
}

class FetchDataEx extends AppException {
  FetchDataEx({String? message}) : super(message ?? 'No internet connection');
}

class ServerEx extends AppException {
  ServerEx({String? message})
      : super(message ?? 'an error from server try again');
}

class NotFoundEx extends AppException {
  NotFoundEx({String? message})
      : super(message ?? 'Can not found any question for this category');
}

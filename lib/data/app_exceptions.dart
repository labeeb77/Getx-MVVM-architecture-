class AppExceptions implements Exception {

  final _message;
  final _prefix;

  AppExceptions([this._message,this._prefix]);

  String toString(){
    return '$_message,$_prefix';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? mesaage]) : super(mesaage,'No internet');
}

class RequesTimeOut extends AppExceptions {
  RequesTimeOut([String? mesaage]) : super(mesaage,'Request Time out');
}

class ServerException extends AppExceptions {
  ServerException([String? mesaage]) : super(mesaage,'Internal Server');
}
class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? mesaage]) : super(mesaage,'Invalid url Exception');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? mesaage]) : super(mesaage,'');
}
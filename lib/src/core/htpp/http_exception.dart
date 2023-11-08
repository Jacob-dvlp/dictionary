// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dictionary_app/src/core/htpp/http_response.dart';

class HttpExceptionCustom  {
  String? message;
  int? statusCode;
  dynamic error;
  HttpResponse response;

  HttpExceptionCustom({
    this.message,
    this.statusCode,
    required this.error,
    required this.response,
  });

  
}

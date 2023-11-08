import 'dart:developer';

import 'package:dictionary_app/src/core/htpp/http_exception.dart';
import 'package:dictionary_app/src/core/htpp/http_response.dart';
import 'package:dio/dio.dart';

import 'i_http.dart';

 String? customMessage;
class HttpDio implements IHttp {
  late final Dio _dio;

  HttpDio({BaseOptions? baseOptions}) {
    _dio = Dio(baseOptions ?? _defaultOptions);
  }

  final _defaultOptions = BaseOptions(
    baseUrl: "https://api.dictionaryapi.dev/api/v2/entries/en/",
  );

  @override
  Future<HttpResponse<T>> get<T>(String path, {Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      _logInfo(path, "GET", queryParamters: query);
      DateTime start = DateTime.now();
      final response = await _dio.get(
        path,
        queryParameters: query,
        options: Options(headers: headers),
      );
      DateTime end = DateTime.now();
      _logResponse(path, "GET", response: response, time: end.difference(start).inMilliseconds.toString(),message: response);
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> post<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> request<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  Future<HttpResponse<T>> _dioResponseConverter<T>(Response<dynamic> response) async {
    return HttpResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      message: response.statusMessage,
    );
  }

  Never _trowRestClientException(DioException dioError) {
    final response = dioError.response;
    customMessage = response?.data["title"];
    throw HttpExceptionCustom(
      error: dioError.error,
      message: response?.statusMessage,
      statusCode: response?.statusCode,
      response: HttpResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        message: response?.statusMessage,
      ),
    );
    
  }

  _logInfo(String path, String methodo, {Map<String, dynamic>? queryParamters, dynamic data}) {
    log('METHOD: $methodo \nPATH: ${_dio.options.baseUrl}$path \nQUERYPARAMTERS: $queryParamters \nDATA: $data');
  }

  _logResponse(String path, String methodo,  {Response? response, String? time, Response? message}) {
    if (response?.statusCode == 200) {
      log(
          '[RESPONSE]: ${response?.statusCode}\nMETHOD: $methodo \nPATH: ${_dio.options.baseUrl}$path \nTIME: 🕑$time ms \nRESPONSE: ${response?.data}');
    } else {
     log("Jacob ${response!.statusCode}");

      log(
          '[RESPONSE]: ${response.statusCode}\nMETHOD: $methodo \nPATH: ${_dio.options.baseUrl}$path \nTIME: 🕑$time ms \nRESPONSE: ${response.data}');
    }
  }
}

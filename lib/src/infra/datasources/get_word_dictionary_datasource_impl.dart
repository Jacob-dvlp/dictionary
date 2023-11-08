import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import '../../core/htpp/http_exception.dart';
import '../models/words_dictionary_model.dart';
import 'get_word_dictionary_datasource.dart';

class GetWordDictionaryDatasourceImpl extends GetWordDictionaryDatasource {
  @override
  Future<WordsDictionaryModel> getWordDictionary() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/dictionary.json');
      final data =  json.decode(response);
      final model = WordsDictionaryModel.fromJson(data);
      return model;
    } on HttpExceptionCustom catch (e) {
      return throw  SocketException("${e.response}");
    }
  }
}

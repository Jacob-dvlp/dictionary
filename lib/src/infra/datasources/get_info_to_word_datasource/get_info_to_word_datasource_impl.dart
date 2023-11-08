import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dictionary_app/src/core/htpp/http_exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/htpp/i_http.dart';
import '../../../core/local_storage/local_storage.dart';
import '../../models/dictionary_model.dart';
import 'get_info_to_word_datasource.dart';

class GetInfoToWordDatasourceImpl extends GetInfoToWordDatasource {
  final IHttp iHttp;
  final LocalStorage localStorageImp;

  GetInfoToWordDatasourceImpl( {required this.iHttp, required this.localStorageImp,});
  @override
  Future<List<WordsDictionaryModelInfor>> getInforWord(
      {required String word}) async {
    try {
      List<WordsDictionaryModelInfor> wordsResponse = [];

      final local = Hive.box("wordsStorage");
      if (await local.get(word) == null) {
        final response = await iHttp.get(word);
        if (response.statusCode == 200) {
          String covertToString = json.encode(response.data);
          await localStorageImp.save(
              key: word,
              value: covertToString,
              localStorage: Hive.box("wordsStorage"));

          wordsResponse = wordsDictionaryModelFromJson(covertToString);
        }
        return wordsResponse;
      } else {
        final value = await localStorageImp.readStorage(
            key: word, localStorage: Hive.box("wordsStorage"));
        wordsResponse = wordsDictionaryModelFromJson(value);
        log("LocalStorage: $wordsResponse");
        return wordsResponse;
      }
    } on HttpExceptionCustom catch (e) {
      return throw SocketException(
          "${e.response.data["message"]} ${e.response.data["resolution"]} ");
    }
  }
}

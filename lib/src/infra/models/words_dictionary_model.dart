
import 'dart:convert';

import '../../domain/entities/dictionary_entitie.dart';


WordsDictionaryModel wordsDictionaryModelFromJson(String str) => WordsDictionaryModel.fromJson(json.decode(str));

String wordsDictionaryModelToJson(WordsDictionaryModel data) => json.encode(data.toJson());

class WordsDictionaryModel extends WordsDictionaryModelEntitie{
  final  List<Map<String, int>> resultsData;

  const  WordsDictionaryModel({
        required this.resultsData,
    }):super(results: resultsData);

    factory WordsDictionaryModel.fromJson(Map<String, dynamic> json) => WordsDictionaryModel(
        resultsData: List<Map<String, int>>.from(json["results"].map((x) => Map.from(x).map((k, v) => MapEntry<String, int>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}

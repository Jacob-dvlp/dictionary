import 'dart:convert';

import '../../domain/entities/infor_to_word_entitie.dart';
import 'license_model.dart';
import 'meaning_model.dart';
import 'phonetic_model.dart';

List<WordsDictionaryModelInfor> wordsDictionaryModelFromJson(String str) =>
    List<WordsDictionaryModelInfor>.from(
        json.decode(str).map((x) => WordsDictionaryModelInfor.fromJson(x)));

class WordsDictionaryModelInfor extends InforToWordEntitie {
  final String word;
  final String? phonetic;
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;
  final License license;
  final List<String> sourceUrls;

  const WordsDictionaryModelInfor({
    required this.word,
    this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  }) : super(
            licenseEntitie: license,
            meaningsEntitie: meanings,
            phoneticsEntitie: phonetics,
            phoneticInfo: phonetic,
            sourceUrlsInfo: sourceUrls,
            wordInfo: word);

  factory WordsDictionaryModelInfor.fromJson(Map<String, dynamic>? json) {
    try {
      return WordsDictionaryModelInfor(
        word: json!["word"],
        phonetic: json["phonetic"],
        phonetics: List<Phonetic>.from(
            json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: List<Meaning>.from(
            json["meanings"].map((x) => Meaning.fromJson(x))),
        license: License.fromJson(json["license"]),
        sourceUrls: List<String>.from(json["sourceUrls"].map((x) => x)),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}

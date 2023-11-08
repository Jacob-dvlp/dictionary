import '../../domain/entities/meaning_entitie.dart';
import 'definition_model.dart';

class Meaning extends MeaningEntitie {
  final String partOfSpeech;
  final List<Definition> definitions;
  final List<dynamic> synonyms;
  final List<dynamic> antonyms;

  const Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  }) : super(
            antonymsWord: antonyms,
            definitionsWord: definitions,
            partOfSpeechWord: partOfSpeech,
            synonymsWord: synonyms);

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromJson(x))),
        synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
      );

}

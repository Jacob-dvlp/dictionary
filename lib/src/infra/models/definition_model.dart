import '../../domain/entities/definition_entitie.dart';

class Definition extends DefinitionEntitie {
  final String definition;
  final List<dynamic> synonyms;
  final List<dynamic> antonyms;
  final String? example;

  const Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  }) : super(
            antonymsWord: antonyms,
            definitionWord: definition,
            synonymsWord: synonyms,
            exampleWord: example);

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
        example: json["example"],
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
        "example": example,
      };
}

import 'package:equatable/equatable.dart';

import 'definition_entitie.dart';

class MeaningEntitie extends Equatable {
  final String partOfSpeechWord;
  final List<DefinitionEntitie> definitionsWord;
  final List<dynamic> synonymsWord;
  final List<dynamic> antonymsWord;

  const MeaningEntitie({
    required this.partOfSpeechWord,
    required this.definitionsWord,
    required this.synonymsWord,
    required this.antonymsWord,
  });

  @override
  List<Object?> get props =>
      [partOfSpeechWord, definitionsWord, synonymsWord, antonymsWord];
}

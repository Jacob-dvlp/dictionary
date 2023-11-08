import 'package:equatable/equatable.dart';

class WordsDictionaryModelEntitie extends Equatable {
  final List<Map<String, int>> results;

  const WordsDictionaryModelEntitie({
    required this.results,
  });

  @override
  List<Object?> get props => [results];
}

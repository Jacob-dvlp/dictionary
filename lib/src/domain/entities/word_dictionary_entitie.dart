import 'package:equatable/equatable.dart';

class WordDictionaryEntitie extends Equatable {
  final String name;

  const WordDictionaryEntitie({required this.name});

  @override
  List<Object> get props => [name];
}

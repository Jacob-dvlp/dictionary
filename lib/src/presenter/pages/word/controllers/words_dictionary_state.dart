part of 'words_dictionary_cubit.dart';

sealed class WordsDictionaryState extends Equatable {
  const WordsDictionaryState();

  @override
  List<Object> get props => [];
}


final class WordsDictionaryInitial extends WordsDictionaryState {}
final class WordsDictionaryEmpty extends WordsDictionaryState {}

final class WordsDictionarySuccesse extends WordsDictionaryState {
  final List<WordDictionaryEntitie> wordDictionaryEntitie ;

 const WordsDictionarySuccesse({required this.wordDictionaryEntitie});

  @override
  List<Object> get props => [wordDictionaryEntitie];
}

class PokedexLoadFailure extends WordsDictionaryState {
  final String mensage;

  const PokedexLoadFailure({required this.mensage});

  @override
  List<Object> get props => [mensage];
}
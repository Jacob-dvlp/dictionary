import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/word_dictionary_entitie.dart';
import '../../../../domain/usecases/get_word_dictionary_usecase.dart';

part 'words_dictionary_state.dart';

class WordsDictionaryCubit extends Cubit<WordsDictionaryState> {
  final GetWordDictionaryUsecase getWordDictionaryUsecaseImp;
  WordsDictionaryCubit( {required this.getWordDictionaryUsecaseImp,})
      : super(WordsDictionaryInitial()) {
    getWordDictionary();
  }

  Future getWordDictionary() async {
    try {
      emit(WordsDictionaryInitial());
      final wordsResponse =
          await getWordDictionaryUsecaseImp.getWordDictionary();
      final right = wordsResponse.fold((l) => null, (r) => r);
      var words = right!.results.asMap();
      final convertToList = words.entries.first.value.entries
          .map((e) => WordDictionaryEntitie(name: e.key))
          .toList();

      emit(WordsDictionarySuccesse(wordDictionaryEntitie: convertToList));
    } on SocketException {
      emit(const PokedexLoadFailure(mensage: "Erro"));
    } catch (_) {
      emit(const PokedexLoadFailure(mensage: "Erro"));
    }
  }
}

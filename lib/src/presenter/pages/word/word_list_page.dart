// ignore_for_file: use_build_context_synchronously, prefer_const_declarations

import 'package:dictionary_app/src/presenter/pages/word/controllers/words_dictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/word_dictionary_entitie.dart';

import '../widgets/custom_card_widget.dart';

class WordList extends ConsumerWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(wordsDictionaryFuture);
    return data.when(
      data: (data) {
        final list = data.fold((l) => null, (r) => r);
        var words = list!.results.asMap();
        final convertToList = words.entries.first.value.entries
            .map((e) => WordDictionaryEntitie(name: e.key))
            .toList();
        return ValueListenableBuilder(
            valueListenable: Hive.box("favoriteWords").listenable(),
            builder: (context, box, child) {
              return Container(
                margin: const EdgeInsets.only(top: 50),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: convertToList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final shortState = convertToList;
                    final WordDictionaryEntitie words = shortState[index];
                    final favorite = box.get(index) != null;
                    return CustomHistoryAndFavoritWiget(
                      word: words.name,
                      index: index,
                      favorite: favorite,
                      box: box,
                      isHome: true,
                    );
                  },
                ),
              );
            });
      },
      error: (error, r) {
        return const Center(child: Text("Error"));
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

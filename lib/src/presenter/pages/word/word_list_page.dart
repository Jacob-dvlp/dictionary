// ignore_for_file: use_build_context_synchronously, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/word_dictionary_entitie.dart';

import '../widgets/custom_card_widget.dart';
import 'controllers/words_dictionary_cubit.dart';

class WordList extends StatelessWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordsDictionaryCubit, WordsDictionaryState>(
      builder: (context, state) {
        if (state is WordsDictionaryInitial) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is WordsDictionaryEmpty) {
          return const Center(child: Text("Empty"));
        }
        if (state is PokedexLoadFailure) {
          return Center(child: Text(state.mensage));
        }
        if (state is WordsDictionarySuccesse) {
          return ValueListenableBuilder(
              valueListenable: Hive.box("favoriteWords").listenable(),
              builder: (context, box, child) {
                return Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: state.wordDictionaryEntitie.length,
                    itemBuilder: (BuildContext context, int index) {
                      final shortState = state.wordDictionaryEntitie;
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
        }
        return const SizedBox.shrink();
      },
    );
  }
}

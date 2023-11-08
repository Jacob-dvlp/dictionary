// ignore_for_file: use_build_context_synchronously

import 'package:dictionary_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../helper/message_custom.dart';
import '../details/controller/details_cubit.dart';
import '../details/details_word_widget.dart';

class CustomHistoryAndFavoritWiget extends StatelessWidget {
  final String word;
  final int index;
  final bool? isHistory;
  final bool? isHome;
  final bool? favorite;
  final Box<dynamic>? box;

  const CustomHistoryAndFavoritWiget(
      {super.key,
      required this.word,
      required this.index,
      this.box,
      this.isHistory,
      this.favorite,
      this.isHome});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(
          valueListenable: Hive.box("wordHistory").listenable(),
          builder: (context, value, child) {
            return GestureDetector(
              onTap: () async {
                context.read<DetailsCubit>().getInfo(word: word);
                final isHistory = value.get(index) != null;
                if (!isHistory) {
                  await value.put(index, word);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailsWordWidget(
                      word: word,
                      index: index,
                    );
                  }),
                );
               
              },
              child: Card(
                child: Stack(
                  children: [
                    isHome!
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () async {
                                    if (favorite!) {
                                      Messages.of(context)
                                          .showError("Removed like");
                                      await box!.delete(index);
                                    } else {
                                      await box!.put(index, word);
                                      Messages.of(context).showSuccess(
                                        "Favorited",
                                      );
                                    }
                                  },
                                  child: Icon(
                                    favorite!
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: Colors.red,
                                  )),
                            ))
                        : isHistory!
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      Messages.of(context)
                                          .showError("Delected in list");

                                      await box!.deleteAt(index);
                                    },
                                    child: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ))
                            : const Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text(word.capitalizeFirstLetter())),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },),
    );
  }
}

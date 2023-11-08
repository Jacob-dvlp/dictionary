import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/custom_card_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("wordHistory").listenable(),
      builder: (context, value, child) {
        return Container(
          margin: const EdgeInsets.only(top: 50),
          child: value.length != 0
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: value.length,
                  itemBuilder: (BuildContext context, int index) {
                    final favorite = value.getAt(index);
                    String word = favorite.toString();
                    return CustomHistoryAndFavoritWiget(
                      index: index,
                      word: word,
                      box: value,
                      isHistory: true,
                      isHome: false,
                    );
                  },
                )
              : const Center(
                  child: Text("List Empty"),
                ),
        );
      },
    );
  }
}

import 'package:dictionary_app/src/presenter/pages/favorites/favorites_pages.dart';
import 'package:dictionary_app/src/presenter/pages/history/history_page.dart';
import 'package:dictionary_app/src/presenter/pages/word/word_list_page.dart';
import 'package:flutter/material.dart';

class CustomCardHeaderWidget extends StatefulWidget {
  const CustomCardHeaderWidget({super.key});

  @override
  State<CustomCardHeaderWidget> createState() => _CustomCardHeaderWidgetState();
}

class _CustomCardHeaderWidgetState extends State<CustomCardHeaderWidget> {
  bool isHome = true;
  bool isHistory = false;
  bool isFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isHome = true;
                    isFavorites = false;
                    isHistory = false;
                  });
                },
                child: const SizedBox(
                  height: 40,
                  child: Card(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 12),
                        child: Text("Word List"),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isHistory = true;
                    isHome = false;
                    isFavorites = false;
                  });
                },
                child: const SizedBox(
                  height: 40,
                  child: Card(
                      child: Center(
                          child: Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12),
                    child: Text("History"),
                  ))),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isHistory = false;
                    isHome = false;
                    isFavorites = true;
                  });
                },
                child: const SizedBox(
                  height: 40,
                  child: Card(
                      child: Center(
                          child: Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12),
                    child: Text("Favorites"),
                  ))),
                ),
              ),
            ],
          ),
          if (isHome) const WordList(),
          if (isHistory) const HistoryPage(),
          if (isFavorites) const FavoritesPages()
        ],
      ),
    );
  }
}

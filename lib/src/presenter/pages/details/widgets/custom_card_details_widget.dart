import 'package:dictionary_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomCardDetailsWidget extends StatelessWidget {
  final String word;
  final String pronunciation;
  final int index;

  const CustomCardDetailsWidget(
      {super.key,
      required this.word,
      required this.pronunciation,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("favoriteWords").listenable(),
      builder: (context, box, child) {
        final favorite = box.get(index) != null;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Card(
              elevation: 20,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                          favorite
                              ? Icons.favorite
                              : Icons.favorite_outline_outlined,
                          color: Colors.red,
                        )
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          word.capitalizeFirstLetter(),
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Text(
                          pronunciation.capitalizeFirstLetter(),
                          style: const TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

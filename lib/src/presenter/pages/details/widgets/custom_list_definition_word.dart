import 'package:dictionary_app/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/infor_to_word_entitie.dart';

class CustomListDefinitionWord extends StatelessWidget {
  const CustomListDefinitionWord({
    super.key,
    required this.inforToWordEntitie,
  });

  final InforToWordEntitie inforToWordEntitie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          final meanings = inforToWordEntitie
              .meaningsEntitie[index];
          return Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                  "Part Of Speech: ${meanings.partOfSpeechWord.capitalizeFirstLetter()}"),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Definition:",
                style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 16),
              ),
             
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection:
                  
                      Axis.horizontal,
                  itemCount: 1,
                  itemBuilder:
                  
                      (context, index) {
                    final _definition =
                        meanings
                            .definitionsWord;
                    return SizedBox(
                      width: 380,
                      child: Text(
                        _definition[0]
                            .definitionWord,
                            textAlign: TextAlign.justify,
                                     
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
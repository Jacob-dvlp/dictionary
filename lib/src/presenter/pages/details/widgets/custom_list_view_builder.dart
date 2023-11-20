import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary_app/src/helper/message_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/infor_to_word_entitie.dart';
import '../details_word_widget.dart';
import 'custom_card_details_widget.dart';
import 'custom_list_definition_word.dart';

class ListViewBuilderItens extends ConsumerWidget {
  const ListViewBuilderItens({
    super.key,
    required this.inforToWordEntitie,
    required this.widget,
    required this.duration,
    required this.position,
    required this.audioPlayer,
    required this.isPlaying,
  });

  final InforToWordEntitie inforToWordEntitie;
  final DetailsWordWidgetR widget;
  final Duration duration;
  final Duration position;
  final AudioPlayer audioPlayer;
  final bool isPlaying;

  @override
  Widget build(BuildContext context,ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.longestSide / 2.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomCardDetailsWidget(
            pronunciation:
                inforToWordEntitie.phoneticInfo ?? "The lleter n have phonetic",
            word: widget.word!,
            index: widget.index!,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Slider(
                  max: duration.inMilliseconds.toDouble(),
                  value: position.inMilliseconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(microseconds: value.toInt());
                    await audioPlayer.seek(position);
                    await audioPlayer.resume();
                  },
                ),
                GestureDetector(
                  onTap: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      List<String>? mp3 = inforToWordEntitie.phoneticsEntitie
                          .map((e) => e.audioWord)
                          .toList();
                      String url = "";
                      if (mp3.length == 1) {
                        if (mp3[0].isNotEmpty) {
                          url = mp3[0];
                        }
                        if (mp3[0].isEmpty) {
                          return Messages.of(context)
                              .showError(" No have audio");
                        }
                      }
                      if (mp3.length == 2) {
                        if (mp3[1].isNotEmpty) {
                          url = mp3[1];
                        }
                        if (mp3[1].isEmpty) {
                          return Messages.of(context)
                              .showError(" No have audio");
                        }
                      }
                      if (mp3.length == 3) {
                        if (mp3[2].isNotEmpty) {
                          url = mp3[2];
                        }
                        if (mp3[2].isEmpty) {
                          return Messages.of(context)
                              .showError(" No have audio");
                        }
                      }
                      if (mp3.isEmpty) {
                        return Messages.of(context).showError(" No have audio");
                      }
                      url.isEmpty
                          ? const SizedBox.shrink()
                          : await audioPlayer.play(UrlSource(url));
                    }
                  },
                  child: CircleAvatar(
                    child: Icon(!isPlaying ? Icons.play_arrow : Icons.pause),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Meanings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomListDefinitionWord(
                      inforToWordEntitie: inforToWordEntitie)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary_app/src/presenter/pages/details/controller/get_info_word.dart';
import 'package:dictionary_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/infor_to_word_entitie.dart';
import 'controller/details_cubit.dart';
import 'widgets/custom_elevatedbutton_details_widget.dart';
import 'widgets/custom_list_view_builder.dart';

class DetailsWordWidgetR extends ConsumerStatefulWidget {
  final String? word;
  final int? index;
  const DetailsWordWidgetR(this.word, this.index, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailsWordWidgetRState();
}

class _DetailsWordWidgetRState extends ConsumerState<DetailsWordWidgetR> {
  final audioPlayer = AudioPlayer();
  late ScrollController controller;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  double currentPageIndex = 0;

  @override
  void initState() {
    controller = ScrollController();
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });
    audioPlayer.onPositionChanged.listen((positionLisen) {
      if (mounted) {
        setState(() {
          position = positionLisen;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word!.capitalizeFirstLetter()),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final data = ref
              .watch(getInfoWordProviderFuture(ref: ref, value: widget.word));
          return data.when(
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            data: (data) {
              final word = data.fold((l) => null, (r) => r);

              return Stack(
                children: [
                  ListView.builder(
                    controller: controller,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: word!.length,
                    padding: EdgeInsets.all(Platform.isAndroid ? 12 : 0),
                    itemBuilder: (context, index) {
                      final InforToWordEntitie inforToWordEntitie = word[index];
                      return ListViewBuilderItens(
                        inforToWordEntitie: inforToWordEntitie,
                        widget: widget,
                        duration: duration,
                        position: position,
                        audioPlayer: audioPlayer,
                        isPlaying: isPlaying,
                      );
                    },
                  ),
                  controllerListView()
                ],
              );
            },
          );
        },
      ),
    );
  }

  Padding controllerListView() {
    return Padding(
      padding: EdgeInsets.only(bottom: Platform.isAndroid ? 170 : 90),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomElevatedbuttonDetailsWidgetarrowback(
                onTap: () {
                  controller.animateTo(
                    (currentPageIndex - 2) *
                        (MediaQuery.of(context).size.longestSide / 2.2),
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 100),
                  );
                  setState(() {
                    currentPageIndex--;
                  });
                },
                title: "Voltar",
                icon: Icons.arrow_back_ios),
            CustomElevatedbuttonDetailsWidgetarrowbackRight(
              icon: Icons.arrow_forward_ios,
              onTap: () {
                controller.animateTo(
                  (currentPageIndex) *
                      (MediaQuery.of(context).size.longestSide / 2.2),
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 100),
                );
                setState(() {
                  currentPageIndex++;
                });
                // context.read<DetailsCubitInt>().decrement();
              },
              title: "Proxima",
            )
          ],
        ),
      ),
    );
  }
}

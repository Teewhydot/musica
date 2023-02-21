// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/musica/domain/entities/riverpod_file.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/glassmorphism.dart';
import 'package:provider/provider.dart';

class GlassPlayerCard extends StatelessWidget {
  final String currentPlayingMusicTitle;
  final String musicArtist;
  final String imageLink;

  const GlassPlayerCard(
      {super.key,
      required this.currentPlayingMusicTitle,
      required this.musicArtist,
      required this.imageLink});

  @override
  Widget build(BuildContext context) {
    final musicPlayerProvider = Provider.of<MusicPlayerProvider>(context);
    return GlassMorphicContainer(
        500.0,
        100.0,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addHorizontalSpacing(10),
                  Column(
                    children: [
                      addVerticalSpacing(15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: textColor, width: 2)),
                          height: 60,
                          width: 60,
                          child: Image.network(
                            imageLink,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addHorizontalSpacing(10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addVerticalSpacing(10),
                        Text(currentPlayingMusicTitle,
                            overflow: TextOverflow.ellipsis,
                            style: mediumWhiteTextStyle),
                        Text(musicArtist,
                            style:
                                smallWhiteTextStyle.copyWith(color: textColor)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      musicPlayerProvider.pauseMusic();
                    },
                    child: Icon(Icons.pause, color: textColor)),
                addHorizontalSpacing(10),
                GestureDetector(
                    onTap: () {
                      musicPlayerProvider.resumeMusic();
                    },
                    child: Image.asset(Assets.iconsPlaymusic)),
                addHorizontalSpacing(10),
                Icon(Icons.skip_next, color: textColor),
                addHorizontalSpacing(30),
              ],
            ),
          ],
        ));
  }
}

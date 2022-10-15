// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/reusables/widgets/glassmorphism.dart';

class GlassPlayerCard extends StatefulWidget {
  final String currentPlayingMusicTitle;
  final String musicArtist;
  final String imageLink;
  final pauseMusicFunction;
  final playMusicFunction;

  const GlassPlayerCard(
      {super.key,
      required this.currentPlayingMusicTitle,
      required this.musicArtist,
      required this.pauseMusicFunction,
      required this.playMusicFunction,
      required this.imageLink});

  @override
  State<GlassPlayerCard> createState() => _GlassPlayerCardState();
}

class _GlassPlayerCardState extends State<GlassPlayerCard> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = true;
  Duration position = const Duration(seconds: 0);
  Duration duration = const Duration(seconds: 0);


  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
        print(isPlaying);
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                            border: Border.all(color: textColor,width: 2)
                          ),
                          height: 60,
                          width: 60,
                          child: Image.network(
                            widget.imageLink,
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
                        Text(widget.currentPlayingMusicTitle,
                            overflow: TextOverflow.ellipsis,
                            style: mediumWhiteTextStyle),
                        Text(widget.musicArtist,
                            style: smallWhiteTextStyle.copyWith(
                                color: textColor)),
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
                    onTap:() {

                      widget.pauseMusicFunction;
                      },
                    child: Icon(Icons.pause, color: textColor)),
                addHorizontalSpacing(10),
                GestureDetector(
                    onTap: (){

                      widget.playMusicFunction;},
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

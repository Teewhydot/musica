// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musica/musica/domain/entities/riverpod_file.dart';
import 'package:musica/musica/presentation/manager/music_control_bloc.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/glassmorphism.dart';
import 'package:provider/provider.dart';

class GlassPlayerCard extends StatelessWidget {
  final String currentPlayingMusicTitle;
  final String musicArtist;
  final String imageLink;
  final MusicControlBloc? musicControlBloc;

  GlassPlayerCard(
      {required this.currentPlayingMusicTitle,
      required this.musicArtist,
      required this.imageLink,
      this.musicControlBloc})
      : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    final musicBloc = BlocProvider.of<MusicControlBloc>(context);
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
                // GestureDetector(
                //     onTap: () {
                //       musicPlayerProvider.pauseMusic();
                //     },
                //     child: I
                //     con(Icons.pause, color: textColor)),
                addHorizontalSpacing(10),
                BlocBuilder<MusicControlBloc, MusicControlState>(
                    builder: (context, state) {
                  if (state is MusicControlInitialState) {
                    return GestureDetector(
                        onTap: () {
                          musicBloc.add(MusicControlPlayEvent());
                        },
                        child: Icon(Icons.play_arrow, color: textColor));
                  } else if (state is MusicControlLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kDefaultIconDarkColor,
                        value: 0.5,
                        strokeWidth: 2,
                        key: Key('musicLoading'),
                      ),
                    );
                  } else if (state is MusicControlPlayingState) {
                    return GestureDetector(
                        onTap: () {
                          musicBloc.add(MusicControlPlayEvent());
                        },
                        child: Icon(Icons.pause, color: textColor));
                  } else {
                    return Container();
                  }
                }),
                addHorizontalSpacing(10),
                Icon(Icons.skip_previous, color: textColor),
                addHorizontalSpacing(20),
                Icon(Icons.skip_next, color: textColor),
                addHorizontalSpacing(50),
              ],
            ),
          ],
        ));
  }
}

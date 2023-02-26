// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musica/musica/domain/entities/riverpod_file.dart';
import 'package:musica/musica/presentation/manager/music_control_bloc.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class GlassPlayerCard extends StatelessWidget {
  final String currentPlayingMusicTitle;
  final String musicArtist;
  final String imageLink;
  final String currentTrackLink;
  final MusicControlBloc? musicControlBloc;

  GlassPlayerCard(
      {required this.currentPlayingMusicTitle,
      required this.musicArtist,
      required this.imageLink,
      required this.currentTrackLink,
      this.musicControlBloc})
      : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    final musicBloc = BlocProvider.of<MusicControlBloc>(context);
    final musicPlayerProvider =
        Provider.of<MusicPlayerProvider>(context, listen: false);
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
                addHorizontalSpacing(10),
                Icon(
                  Icons.skip_previous,
                  color: textColor,
                  size: 35,
                ),
                addHorizontalSpacing(20),
                BlocBuilder<MusicControlBloc, MusicControlState>(
                    builder: (context, state) {
                  if (state is MusicControlInitialState) {
                    return GestureDetector(
                        onTap: () {
                          musicBloc.add(MusicControlPlayEvent(
                              trackLink: currentTrackLink));
                        },
                        child:
                            Icon(Icons.play_arrow, color: textColor, size: 35));
                  } else if (state is MusicControlLoadingState) {
                    return const Center(
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: CircularProgressIndicator(
                          color: kDefaultIconDarkColor,
                        ),
                      ),
                    );
                  } else if (state is MusicControlPlayingState) {
                    return GestureDetector(
                        onTap: () async {
                          musicBloc.add(MusicControlPauseEvent());
                        },
                        child: Icon(Icons.pause, color: textColor, size: 35));
                  } else if (state is MusicControlFailedState) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Could\'nt play music'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.grey,
                      ));
                    });
                    return GestureDetector(
                        onTap: () {
                          musicBloc.add(MusicControlPlayEvent(
                              trackLink: currentTrackLink));
                        },
                        child: Icon(Icons.replay_circle_filled,
                            color: textColor, size: 35));
                  } else {
                    return Container();
                  }
                }),
                addHorizontalSpacing(20),
                Icon(
                  Icons.skip_next,
                  color: textColor,
                  size: 35,
                ),
                addHorizontalSpacing(50),
              ],
            ),
          ],
        ));
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musica/musica/domain/entities/position_data.dart';
import 'package:musica/musica/domain/entities/riverpod_file.dart';
import 'package:musica/musica/presentation/widgets/constants.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/controls.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/custom_app_bar.dart';
import 'package:musica/musica/presentation/widgets/reused_widgets/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toast/toast.dart';

class GlassPlayerCard extends StatefulWidget {
  final String currentPlayingMusicTitle;
  final String musicArtist;
  final String imageLink;
  final String currentTrackLink;

  GlassPlayerCard({
    required this.currentPlayingMusicTitle,
    required this.musicArtist,
    required this.imageLink,
    required this.currentTrackLink,
  }) : super(key: UniqueKey());

  @override
  State<GlassPlayerCard> createState() => _GlassPlayerCardState();
}

class _GlassPlayerCardState extends State<GlassPlayerCard> {
  AudioPlayer _audioPlayer = AudioPlayer();
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
            position: position,
            bufferedPosition: bufferedPosition,
            duration: duration ?? Duration.zero),
      );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setUrl(widget.currentTrackLink);
    _audioPlayer.positionStream;
    _audioPlayer.durationStream;
    _audioPlayer.bufferedPositionStream;
    _audioPlayer.play();
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ToastContext().init(context);
    final musicPlayerProvider =
        Provider.of<MusicPlayerProvider>(context, listen: false);
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      body: Center(
        child: GlassMorphicContainer(
            size.width,
            size.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                                      border: Border.all(
                                          color: textColor, width: 2)),
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
                    Controls(audioPlayer: _audioPlayer),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: StreamBuilder<PositionData>(
                      stream: _positionDataStream,
                      builder: (context, snapshot) {
                        final positionData = snapshot.data;
                        return ProgressBar(
                          barHeight: 5,
                          thumbRadius: 10,
                          thumbColor: Colors.white,
                          bufferedBarColor: Colors.white.withOpacity(0.5),
                          progressBarColor: Colors.yellowAccent,
                          baseBarColor: Colors.white.withOpacity(0.2),
                          timeLabelTextStyle: smallWhiteTextStyle.copyWith(
                              color: textColor, fontSize: 12),
                          progress: positionData?.position ?? Duration.zero,
                          total: positionData?.duration ?? Duration.zero,
                          buffered:
                              positionData?.bufferedPosition ?? Duration.zero,
                          onSeek: (duration) {
                            _audioPlayer.seek(duration);
                          },
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}

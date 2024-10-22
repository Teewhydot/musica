import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Controls extends StatelessWidget {
  final AudioPlayer audioPlayer;
  const Controls({super.key, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: audioPlayer.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;
          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child:  CircularProgressIndicator(
                color: kDefaultIconDarkColor,
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 40.0,
                  onPressed: audioPlayer.hasPrevious
                      ? () => audioPlayer.seekToPrevious()
                      : null,
                ),
                IconButton(
                  icon: Icon(playing! ? Icons.pause : Icons.play_arrow),
                  iconSize: 40.0,
                  onPressed: () {
                    playing ? audioPlayer.pause() : audioPlayer.play();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  iconSize: 40.0,
                  onPressed: audioPlayer.hasNext
                      ? () => audioPlayer.seekToNext()
                      : null,
                ),
              ],
            );
          }
        });
  }
}

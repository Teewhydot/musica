import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class MusicPlayerProvider extends ChangeNotifier{
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration position = const Duration(seconds: 0);
  Duration duration = const Duration(seconds: 0);

  bool get isPlayingMusic => isPlaying;
  void startState(){

    audioPlayer.onPlayerStateChanged.listen((event) {
        isPlaying = event == PlayerState.playing;
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
        duration = newDuration;
    });

    audioPlayer.onPositionChanged.listen((newPosition) {

        position = newPosition;
    });

    notifyListeners();
  }
  void playMusic(String url)async{
    await audioPlayer.play(UrlSource(url));
    isPlaying = true;
    notifyListeners();
  }
  void pauseMusic()async{

    await audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  void resumeMusic()async{
    await audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }
}
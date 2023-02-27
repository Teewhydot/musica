import 'package:audioplayers/audioplayers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:musica/musica/domain/entities/music_entity.dart';
import 'package:musica/musica/domain/failures/failures.dart';

abstract class MusicaDataSource {
  Future<MusicEntity> getMusicaFromDataSource();
}

abstract class MusicControlPlayMusic {
  void playMusic(String url);
}

abstract class MusicControlClassPauseMusic {
  void pauseMusic();
}

class MusicaDataSourceImplementation implements MusicaDataSource {
  @override
  Future<MusicEntity> getMusicaFromDataSource() async {
    await Future.delayed(const Duration(seconds: 3));
    return MusicEntity();
  }
}

class PlayMusicControlImplementation extends ChangeNotifier
    with MusicControlPlayMusic {
  bool isPlaying = false;
  final audioPlayer = AudioPlayer();
  bool get isPlayingMusic => isPlaying;

  @override
  Future<Either<Failure, MusicEntity>> playMusic(String url) async {
    try {
      await audioPlayer.play(UrlSource(url));
      isPlaying = true;
      notifyListeners();
      return right(MusicEntity());
    } on Exception catch (_) {
      return left(GeneralFailure());
    }
  }

  void resumeMusic() async {
    await audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }
}

class PauseMusicControlImplementation implements MusicControlClassPauseMusic {
  final audioPlayer = AudioPlayer();
  @override
  void pauseMusic() async {
    await audioPlayer.pause();
  }
}

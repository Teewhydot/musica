import 'package:audioplayers/audioplayers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:musica/musica/domain/entities/music_entity.dart';
import 'package:musica/musica/domain/failures/failures.dart';

abstract class MusicaDataSource {
  Future<MusicEntity> getMusicaFromDataSource();
}

abstract class MusicControlClass {
  void playMusic(String url);
}

class MusicaDataSourceImplementation implements MusicaDataSource {
  @override
  Future<MusicEntity> getMusicaFromDataSource() async {
    await Future.delayed(const Duration(seconds: 3));
    return MusicEntity();
  }
}

class MusicControlImplementation extends ChangeNotifier with MusicControlClass {
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

  Future pauseMusic() async {
    await audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  void resumeMusic() async {
    await audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }
}

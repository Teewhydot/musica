import 'package:dartz/dartz.dart';
import 'package:musica/musica/data/data_sources/musica_data_source.dart';
import 'package:musica/musica/domain/entities/music_entity.dart';
import 'package:musica/musica/domain/failures/failures.dart';

class PlayMusicUseCase {
  final PlayMusicControlImplementation musicControl =
      PlayMusicControlImplementation();
  Future<Either<Failure, MusicEntity>> playMusic(String url) async {
    return musicControl.playMusic(url);
  }
}

class PauseMusicUseCase {
  final PauseMusicControlImplementation pauseMusicControl =
      PauseMusicControlImplementation();
  Future pauseMusic() async {
    return pauseMusicControl.pauseMusic();
  }
}

import 'package:musica/musica/domain/entities/music_entity.dart';

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

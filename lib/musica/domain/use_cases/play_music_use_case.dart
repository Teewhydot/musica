import 'package:dartz/dartz.dart';
import 'package:musica/musica/domain/entities/music_entity.dart';
import 'package:musica/musica/domain/failures/failures.dart';

class PlayMusicUseCase {
  Future<Either<Failure, MusicEntity>> playMusic() async {
    await Future.delayed(const Duration(seconds: 3));
    return left(GeneralFailure());
  }
}

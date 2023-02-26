import 'package:dartz/dartz.dart';
import 'package:musica/musica/domain/entities/music_entity.dart';
import 'package:musica/musica/domain/failures/failures.dart';

abstract class MusicaRepo {
  Future<Either<Failure, MusicEntity>> getMusicaFromDataSource();
}

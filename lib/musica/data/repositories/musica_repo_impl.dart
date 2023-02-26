import 'package:dartz/dartz.dart';
import 'package:musica/musica/data/data_sources/musica_data_source.dart';
import 'package:musica/musica/domain/entities/music_entity.dart';
import 'package:musica/musica/domain/failures/failures.dart';
import 'package:musica/musica/domain/repositories/musica_repo.dart';

class MusicaRepoImplementation implements MusicaRepo {
  final MusicaDataSource musicaDataSource = MusicaDataSourceImplementation();

  @override
  Future<Either<Failure, MusicEntity>> getMusicaFromDataSource() async {
    try {
      final result = await musicaDataSource.getMusicaFromDataSource();
      return right(result);
    } on Exception catch (_) {
      return left(GeneralFailure());
    }
  }
}

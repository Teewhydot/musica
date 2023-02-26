import 'package:musica/musica/domain/failures/failures.dart';

String mapFailureToMessage(Failure failures) {
  switch (failures.runtimeType) {
    case ServerFailure:
      return 'Server Failure';
    case CacheFailure:
      return 'Cache Failure';
    case GeneralFailure:
      return 'General Failure';
    default:
      return 'Nothing went wrong';
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musica/musica/domain/use_cases/music_use_case.dart';

part 'music_control_event.dart';
part 'music_control_state.dart';

class MusicControlBloc extends Bloc<MusicControlEvent, MusicControlState> {
  Stream<String> mapEventToState(MusicControlPlayEvent event) async* {
    yield event.trackLink;
  }

  MusicControlBloc() : super(MusicControlInitialState()) {
    final musicaUseCase = PlayMusicUseCase();
    on<MusicControlPlayEvent>((event, emit) async {
      emit(MusicControlLoadingState());
      final result = await musicaUseCase.playMusic(event.trackLink);
      result.fold((failure) => emit(MusicControlFailedState()),
          (music) => emit(MusicControlPlayingState()));
    });

    on<MusicControlPauseEvent>((event, emit) {
      final pauseMusicUseCase = PauseMusicUseCase();
      pauseMusicUseCase.pauseMusic();
      emit(MusicControlInitialState());
    });
  }
}

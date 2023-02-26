import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musica/musica/domain/use_cases/play_music_use_case.dart';

part 'music_control_event.dart';
part 'music_control_state.dart';

class MusicControlBloc extends Bloc<MusicControlEvent, MusicControlState> {
  MusicControlBloc() : super(MusicControlInitialState()) {
    final musicaUseCase = PlayMusicUseCase();
    on<MusicControlPlayEvent>((event, emit) async {
      emit(MusicControlLoadingState());
      final result = await musicaUseCase.playMusic();
      result.fold((failure) => emit(MusicControlFailedState()),
          (music) => emit(MusicControlPlayingState()));
    });

    on<MusicControlPauseEvent>((event, emit) {
      emit(MusicControlInitialState());
    });
  }
}

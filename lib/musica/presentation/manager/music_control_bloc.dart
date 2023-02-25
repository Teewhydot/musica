import 'package:flutter_bloc/flutter_bloc.dart';

part 'music_control_event.dart';
part 'music_control_state.dart';

class MusicControlBloc extends Bloc<MusicControlEvent, MusicControlState> {
  MusicControlBloc() : super(MusicControlInitialState()) {
    on<MusicControlPlayEvent>((event, emit) async {
      emit(MusicControlLoadingState());
      await Future.delayed(const Duration(seconds: 2), () {
        emit(MusicControlPlayingState());
      });
    });

    on<MusicControlPauseEvent>((event, emit) {
      emit(MusicControlInitialState());
    });
  }
}

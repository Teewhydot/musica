part of 'music_control_bloc.dart';

abstract class MusicControlEvent {}

class MusicControlPlayEvent extends MusicControlEvent {
  final String trackLink;
  MusicControlPlayEvent({required this.trackLink});
}

class MusicControlPauseEvent extends MusicControlEvent {}

class MusicFinishedPlayingEvent extends MusicControlEvent {}

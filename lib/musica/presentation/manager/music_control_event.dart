part of 'music_control_bloc.dart';

abstract class MusicControlEvent {}

class MusicControlPlayEvent extends MusicControlEvent {}

class MusicControlPauseEvent extends MusicControlEvent {}

part of 'music_control_bloc.dart';

abstract class MusicControlState {}

class MusicControlInitialState extends MusicControlState {}

class MusicControlLoadingState extends MusicControlState {}

class MusicControlPlayingState extends MusicControlState {}

class MusicControlFailedState extends MusicControlState {}

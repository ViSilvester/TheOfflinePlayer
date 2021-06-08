import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:offline_player/controllers/player_controller.dart';

enum LoopMode {
  none,
  loopOne,
}

class PlayerCubit extends Cubit<PlayerCubitState> {
  PlayerController _controller;

  Stream<Duration> get currentTimeStream => _controller.currentTimeStream;
  LoopMode get loopMode => state.loopMode;

  PlayerCubit() : super(PlayerCubitInitialState()) {
    _controller =
        PlayerController(processingStateListener: _processingStateListner);
  }

  void setMusic(String musicPath) async {
    if (state.musicPath == musicPath) {
      return;
    }

    emit(
      state.copyWith(
        PlayerCubitLoadingState(),
        musicPath: musicPath,
      ),
    );
    try {
      await _controller.setMusic(musicPath);
      emit(
        state.copyWith(
          PlayerCubitLoadSucessState(),
          musicDuration: _controller.musicDuration,
        ),
      );
      play();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  void play() {
    if (_controller.processingState == ProcessingState.completed) {
      setProgress(0);
    }

    _controller.play();
    emit(state.copyWith(PlayerCubitPlayingState()));
  }

  void pause() {
    _controller.pause();
    emit(state.copyWith(PlayerCubitPausedState()));
  }

  void setProgress(double value) {
    _controller.seek(
      Duration(
        milliseconds: (state.musicDuration.inMilliseconds * value).toInt(),
      ),
    );
  }

  void toogleeLoopMode() {
    if (loopMode == LoopMode.none) {
      state.loopMode = LoopMode.loopOne;
    } else {
      state.loopMode = LoopMode.none;
    }
  }

  void _processingStateListner(ProcessingState event) {
    if (event == ProcessingState.completed) {
      if (state.loopMode == LoopMode.loopOne) {
        setProgress(0);
      } else if (state is PlayerCubitPlayingState) {
        pause();
      }
    }
  }

  double timeToProgress(Duration duration) {
    if (duration.inMilliseconds > state.musicDuration.inMilliseconds ?? 0) {
      return 1;
    }
    return (duration.inMilliseconds / this.state.musicDuration.inMilliseconds ??
        0);
  }
}

abstract class PlayerCubitState {
  String musicPath;
  Duration musicDuration;
  LoopMode loopMode = LoopMode.none;

  PlayerCubitState({this.musicDuration, this.musicPath});

  T copyWith<T extends PlayerCubitState>(
    T instance, {
    String musicPath,
    Duration musicDuration,
    LoopMode loopMode,
  }) {
    instance.musicPath = musicPath ?? this.musicPath;
    instance.musicDuration = musicDuration ?? this.musicDuration;
    instance.loopMode = loopMode ?? this.loopMode;
    return instance;
  }
}

class PlayerCubitInitialState extends PlayerCubitState {}

class PlayerCubitLoadingState extends PlayerCubitState {}

class PlayerCubitLoadSucessState extends PlayerCubitState {}

class PlayerCubitPlayingState extends PlayerCubitLoadSucessState {}

class PlayerCubitPausedState extends PlayerCubitLoadSucessState {}

class PlayerCubitErrorState extends PlayerCubitState {}

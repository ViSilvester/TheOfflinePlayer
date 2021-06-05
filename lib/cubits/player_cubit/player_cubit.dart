import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_player/controllers/player_controller.dart';

class PlayerCubit extends Cubit<PlayerCubitState> {
  PlayerCubit() : super(PlayerCubitInitialState());

  PlayerController _controller = PlayerController();

  void setMusic(String musicPath) async {
    if (state.musicPath == musicPath) {
      return;
    }

    emit(state.copyWith(PlayerCubitLoadingState(), musicPath: musicPath));
    try {
      await _controller.setMusic(musicPath);
      emit(
        state.copyWith(
          PlayerCubitLoadSucessState(),
          currentTime: Duration(seconds: 0),
        ),
      );
      play();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  void play() {
    _controller.play();
    emit(state.copyWith(PlayerCubitPlayingState()));
  }

  void pause() {
    _controller.pause();
    emit(state.copyWith(PlayerCubitPausedState()));
  }
}

abstract class PlayerCubitState {
  String musicPath;
  Duration currentTime;
  Duration musicDuration;

  PlayerCubitState({this.currentTime, this.musicDuration, this.musicPath});

  T copyWith<T extends PlayerCubitState>(
    T instance, {
    String musicPath,
    Duration currentTime,
    Duration musicDuration,
  }) {
    instance.musicPath = musicPath ?? this.musicPath;
    instance.currentTime = currentTime ?? this.currentTime;
    instance.musicDuration = musicDuration ?? this.musicDuration;

    return instance;
  }
}

class PlayerCubitInitialState extends PlayerCubitState {}

class PlayerCubitLoadingState extends PlayerCubitState {}

class PlayerCubitLoadSucessState extends PlayerCubitState {}

class PlayerCubitPlayingState extends PlayerCubitLoadSucessState {}

class PlayerCubitPausedState extends PlayerCubitLoadSucessState {}

class PlayerCubitErrorState extends PlayerCubitState {}

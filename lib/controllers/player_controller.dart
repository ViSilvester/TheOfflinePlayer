import 'package:just_audio/just_audio.dart';

class PlayerController {
  AudioPlayer _player;

  PlayerController() {
    _player = AudioPlayer();
  }

  Future<void> setMusic(String path) async {
    await _player.setFilePath(path);
  }

  void play() {
    _player.play();
  }

  Future<void> seek(Duration duration) async {
    await _player.seek(duration);
  }

  Future<void> pause() async {
    await _player.pause();
  }
}

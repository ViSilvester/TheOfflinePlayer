import 'package:just_audio/just_audio.dart';

class PlayerController {
  AudioPlayer _player;

  PlayerController({
    void processingStateListener(ProcessingState event),
  }) {
    _player = AudioPlayer();

    if (processingStateListener != null) {
      print("Listner adicionado");
      _player.processingStateStream.listen(processingStateListener);
    }
  }

  Duration get musicDuration => _player.duration ?? Duration(seconds: 0);
  Duration get currentTime => _player.position ?? Duration(seconds: 0);
  ProcessingState get processingState => _player.processingState;
  Stream<Duration> get currentTimeStream => _player.positionStream;

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

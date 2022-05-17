import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerCubit extends Cubit<FilePickerCubitState> {
  FilePickerCubit() : super(FilePickerCubitInitialState());

  Future<List<FileSystemEntity>> _getFiles() async {
    var permissionStatus = await Permission.storage.status;

    if (permissionStatus.isDenied) {
      if (await Permission.storage.request().isDenied) {
        return [];
      }
    }

    List<FileSystemEntity> _files;
    List<FileSystemEntity> _songs = [];

    try {
      Directory dir = Directory("/storage/emulated/0/download");
      print(dir.path);
      _files = dir.listSync(recursive: false, followLinks: false);
      for (FileSystemEntity entity in _files) {
        String path = entity.path;
        if (path.endsWith('.mp3')) _songs.add(entity);
      }
    } catch (e) {
      print(e);
      return [];
    }

    return _songs;
  }

  void loadFiles() async {
    emit(FilePickerCubitLoadingState());
    var files = await _getFiles();
    emit(FilePickerCubitLoadSucessState(files));
  }
}

abstract class FilePickerCubitState {}

class FilePickerCubitInitialState extends FilePickerCubitState {}

class FilePickerCubitLoadingState extends FilePickerCubitState {}

class FilePickerCubitLoadSucessState extends FilePickerCubitState {
  List<FileSystemEntity> files;
  FilePickerCubitLoadSucessState(this.files);
}

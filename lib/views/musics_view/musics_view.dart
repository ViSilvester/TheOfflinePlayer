import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_player/config/getIt.dart';
import 'package:offline_player/cubits/file_picker_cubit/file_picker_cubit.dart';
import 'package:offline_player/views/musics_view/widgets/music_tile.dart';
import 'package:path/path.dart';

class MusicsView extends StatefulWidget {
  @override
  _MusicsViewState createState() => _MusicsViewState();
}

class _MusicsViewState extends State<MusicsView> {
  @override
  void initState() {
    getIt<FilePickerCubit>().loadFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilePickerCubit, FilePickerCubitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Músicas"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: buildBody(context, state),
        );
      },
    );
  }

  Widget buildBody(BuildContext context, FilePickerCubitState state) {
    switch (state.runtimeType) {
      case FilePickerCubitLoadingState:
        return Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      case FilePickerCubitLoadSucessState:
        return buildMusicList(state);
      default:
        return Container();
    }
  }

  Widget buildMusicList(FilePickerCubitLoadSucessState state) {
    return ListView.builder(
      itemCount: state.files.length,
      itemBuilder: (BuildContext context, int index) {
        return MusicTile(
          basename(state.files[index].path),
          state.files[index].path,
        );
      },
    );
  }
}

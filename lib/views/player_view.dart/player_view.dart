import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_player/config/getIt.dart';
import 'package:offline_player/cubits/player_cubit/player_cubit.dart';
import 'package:path/path.dart';

class PlayerView extends StatefulWidget {
  final String musicPath;

  PlayerView(this.musicPath);

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  double value = 0;

  @override
  void initState() {
    getIt<PlayerCubit>().setMusic(widget.musicPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(basename(widget.musicPath)),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerCubitState>(
      bloc: getIt<PlayerCubit>(),
      builder: (context, state) {
        return Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white30,
                    child: Icon(
                      Icons.music_note,
                      color: Colors.black26,
                      size: 150,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Slider(
                    min: 0,
                    max: 1,
                    value: value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Spacer(),
                        IconButton(
                          iconSize: 48,
                          onPressed: () {},
                          icon: Icon(
                            Icons.fast_rewind,
                          ),
                        ),
                        Container(
                          width: 24,
                        ),
                        buildPlayButton(
                          context,
                          getIt<PlayerCubit>(),
                        ),
                        Container(
                          width: 24,
                        ),
                        IconButton(
                          iconSize: 48,
                          onPressed: () {},
                          icon: Icon(
                            Icons.fast_forward,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildPlayButton(BuildContext context, PlayerCubit cubit) {
    var state = cubit.state;
    switch (state.runtimeType) {
      case PlayerCubitLoadingState:
        return CircularProgressIndicator(
          color: Colors.white24,
        );
      case PlayerCubitPlayingState:
        return IconButton(
          iconSize: 48,
          onPressed: () {
            cubit.pause();
          },
          icon: Icon(
            Icons.pause,
          ),
        );

      default:
        return IconButton(
          iconSize: 48,
          onPressed: () {
            cubit.play();
            print("PLAY");
          },
          icon: Icon(
            Icons.play_arrow,
          ),
        );
    }
  }
}

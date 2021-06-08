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
    var theme = getIt<ThemeData>();
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
                  child: StreamBuilder(
                    stream: getIt<PlayerCubit>().currentTimeStream,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<Duration> snapshot,
                    ) {
                      return Slider(
                        min: 0,
                        max: 1,
                        value: snapshot.hasData &&
                                state is PlayerCubitLoadSucessState
                            ? getIt<PlayerCubit>().timeToProgress(snapshot.data)
                            : 0,
                        onChanged: (value) {
                          if (state is PlayerCubitLoadSucessState) {
                            getIt<PlayerCubit>().setProgress(value);
                          }
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.shuffle,
                          ),
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                              theme.scaffoldBackgroundColor,
                            ),
                            foregroundColor: MaterialStateProperty.all(
                              Colors.black,
                            ),
                            shape: MaterialStateProperty.all(
                              CircleBorder(),
                            ),
                          ),
                        ),
                        Container(
                          width: 12,
                        ),
                        IconButton(
                          iconSize: 48,
                          onPressed: () {},
                          icon: Icon(
                            Icons.fast_rewind,
                          ),
                        ),
                        Container(
                          width: 12,
                        ),
                        buildPlayButton(
                          context,
                          getIt<PlayerCubit>(),
                        ),
                        Container(
                          width: 12,
                        ),
                        IconButton(
                          iconSize: 48,
                          onPressed: () {},
                          icon: Icon(
                            Icons.fast_forward,
                          ),
                        ),
                        Container(
                          width: 12,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              getIt<PlayerCubit>().toogleeLoopMode();
                            });
                          },
                          child: Icon(
                            Icons.repeat,
                          ),
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                              theme.scaffoldBackgroundColor,
                            ),
                            foregroundColor: MaterialStateProperty.all(
                              state.loopMode == LoopMode.loopOne
                                  ? theme.accentColor
                                  : Colors.black,
                            ),
                            shape: MaterialStateProperty.all(
                              CircleBorder(),
                            ),
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
          },
          icon: Icon(
            Icons.play_arrow,
          ),
        );
    }
  }
}

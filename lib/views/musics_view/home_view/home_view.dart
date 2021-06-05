import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:offline_player/config/getIt.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Offline Player"),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 8),
            buildMainPannel(context),
            Container(height: 24),
            buildPlaylistsPannel(context),
            Container(height: 24),
            buildAlbunsPannel(),
            Container(height: 24),
          ],
        ),
      ),
    );
  }

  Widget buildPlaylistsPannel(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Playlists Recentes",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            height: 24,
          ),
          Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                height: 150,
                child: ListView(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Icon(
                              Icons.album,
                              size: 100,
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
                            height: 150,
                            width: 150,
                            child: Text("playlist 1"),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Icon(
                              Icons.album,
                              size: 100,
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
                            height: 150,
                            width: 150,
                            child: Text("playlist 2"),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Icon(
                              Icons.album,
                              size: 100,
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
                            height: 150,
                            width: 150,
                            child: Text("playlist 3"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IgnorePointer(
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.3, 1],
                          colors: [
                            getIt<ThemeData>().scaffoldBackgroundColor,
                            getIt<ThemeData>()
                                .scaffoldBackgroundColor
                                .withAlpha(0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            getIt<ThemeData>().scaffoldBackgroundColor,
                            getIt<ThemeData>()
                                .scaffoldBackgroundColor
                                .withAlpha(0),
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAlbunsPannel() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Albuns Recentes",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            height: 24,
          ),
          Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                height: 150,
                child: ListView(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Icon(
                              Icons.album,
                              size: 100,
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
                            height: 150,
                            width: 150,
                            child: Text("Album 1"),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Icon(
                              Icons.album,
                              size: 100,
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
                            height: 150,
                            width: 150,
                            child: Text("Album 2"),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Icon(
                              Icons.album,
                              size: 100,
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
                            height: 150,
                            width: 150,
                            child: Text("Album 3"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IgnorePointer(
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.3, 1],
                          colors: [
                            getIt<ThemeData>().scaffoldBackgroundColor,
                            getIt<ThemeData>()
                                .scaffoldBackgroundColor
                                .withAlpha(0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            getIt<ThemeData>().scaffoldBackgroundColor,
                            getIt<ThemeData>()
                                .scaffoldBackgroundColor
                                .withAlpha(0),
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMainPannel(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/musics');
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red)),
                  child: Row(
                    children: [
                      Icon(Icons.music_note),
                      Container(
                        width: 24,
                      ),
                      Text("Músicas"),
                    ],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red)),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.list),
                      Container(
                        width: 24,
                      ),
                      Text("Playlists"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red)),
                  child: Row(
                    children: [
                      Icon(Icons.album),
                      Container(
                        width: 24,
                      ),
                      Text("Albuns"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red)),
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      Container(
                        width: 24,
                      ),
                      Text("Favoritos"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:offline_player/views/home_view/home_view.dart';
import 'package:offline_player/views/musics_view/musics_view.dart';
import 'package:offline_player/views/player_view.dart/player_view.dart';
import 'package:offline_player/views/playlists_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  Widget view;

  switch (settings.name) {
    case '/':
      view = HomeView();
      break;
    case '/musics':
      view = MusicsView();
      break;
    case '/playlists':
      view = PlaylistsView();
      break;
    case '/player':
      var path = settings.arguments;
      view = PlayerView(path);
      break;
    default:
      view = HomeView();
      break;
  }

  return MaterialPageRoute(builder: (context) {
    return view;
  });
}

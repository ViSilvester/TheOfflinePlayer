import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  final String title;
  final String path;

  MusicTile(this.title, this.path);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        color: Colors.white24,
        child: Icon(Icons.music_note),
      ),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pushNamed('/player', arguments: path);
      },
    );
  }
}

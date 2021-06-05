import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:offline_player/cubits/file_picker_cubit/file_picker_cubit.dart';
import 'package:offline_player/cubits/player_cubit/player_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<PlayerCubit>(PlayerCubit());
  getIt.registerSingleton<FilePickerCubit>(FilePickerCubit());
  getIt.registerSingleton<ThemeData>(
    ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Colors.red.shade900,
      accentColor: Colors.redAccent,
    ),
  );
}

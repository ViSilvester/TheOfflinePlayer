import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_player/Config/getIt.dart';
import 'package:offline_player/Router/router.dart';
import 'package:offline_player/cubits/file_picker_cubit/file_picker_cubit.dart';
import 'package:offline_player/cubits/player_cubit/player_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(OfflinePlayer());
}

class OfflinePlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlayerCubit>(
          create: (BuildContext context) => getIt<PlayerCubit>(),
        ),
        BlocProvider<FilePickerCubit>(
          create: (BuildContext context) => getIt<FilePickerCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Offline Player',
        theme: getIt<ThemeData>(),
        onGenerateRoute: onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}

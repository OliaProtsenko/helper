import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:helper/common/widgets/current_theme_data.dart';
import 'package:provider/provider.dart';

import 'features/authorization/auth_repository.dart';
import 'features/authorization/session/session_cubit.dart';
import 'features/authorization/session/session_navigator.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CurrentThemeData.theme,
      routes: {
        '/': (context) {
          return Provider(
              create: (context) =>
                  SessionCubit(authRepo: getIt.get<AuthRepository>()),
              child: const SessionNavigator());
        },
      },
    );
  }
}

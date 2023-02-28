import 'package:flutter/material.dart';
import 'package:helper/common/widgets/current_theme_data.dart';

import 'route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:'/',
      onGenerateRoute:RouteGenerator.generateRoute,
      theme: CurrentThemeData.theme,
    );
  }
}



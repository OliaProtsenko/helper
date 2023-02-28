import 'package:flutter/material.dart';
import 'package:helper/features/authorization/sign_up/sign_up_screen.dart';
import 'package:provider/provider.dart';

import 'features/authorization/sign_in/sign_in.dart';
import 'features/authorization/sign_up/bloc/sign_up_bloc.dart';
import 'features/authorization/welcome/widget/welcome_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case '/sign_in':
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case '/sign_up':
        return MaterialPageRoute(
            builder: (context) => Provider<SignUpBloc>(
                create: (_) => SignUpBlocImpl(),
                dispose: (_, bloc) => bloc.dispose(),
                child: const SignUpScreen()));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('ERROR'),
            centerTitle: true,
          ),
          body: const Center(child: Text('Page not found!')));
    });
  }
}

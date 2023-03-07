import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helper/features/authorization/sign_in/bloc/sign_in_bloc.dart';
import 'package:helper/features/authorization/sign_up/bloc/sign_up_bloc.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import 'auth_cubit.dart';
import 'auth_repository.dart';
import 'sign_in/sign_in.dart';
import 'sign_up/sign_up_screen.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          // Show login
          if (state == AuthState.login)
            MaterialPage(
                child: Provider(
                    create: (context) => SignInBloc(
                        authRepo: getIt.get<AuthRepository>(),
                        authCubit: context.read<AuthCubit>()),
                    child: const SignInScreen())),

          // Allow push animation
          if (state == AuthState.signUp) ...[
            // Show Sign up
            MaterialPage(
                child: Provider(
                    create: (context) => SignUpBlocImpl(
                        authRepo: getIt.get<AuthRepository>(),
                        authCubit: context.read<AuthCubit>()),
                    child: const SignUpScreen())),

            // Show confirm sign up
          ]
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}

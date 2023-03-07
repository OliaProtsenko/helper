import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helper/features/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../auth_cubit.dart';
import '../auth_navigator.dart';
import 'session_cubit.dart';
import 'session_state.dart';


class SessionNavigator extends StatelessWidget {
  const SessionNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          // Show loading screen
          if (state is UnknownSessionState)
            const MaterialPage(child: CircularProgressIndicator()),

          // Show auth flow
          if (state is Unauthenticated)
            MaterialPage(
              child: Provider(
                create: (context) =>
                    AuthCubit(sessionCubit: context.read<SessionCubit>()),
                child: const AuthNavigator(),
              ),
            ),

          // Show session flow
          if (state is Authenticated)
            const MaterialPage(child: HomeScreen()),
        ],
        onPopPage: (route, result) => route.didPop(result),
        onGenerateRoute: (settings) {

        },
      );
    });
  }
}

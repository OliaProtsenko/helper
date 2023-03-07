import 'package:flutter_bloc/flutter_bloc.dart';

import 'session/session_cubit.dart';
import 'model/user_data_model.dart';

enum AuthState { login, signUp, confirmSignUp }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.login);

  void showLogin() => emit(AuthState.login);

  void showSignUp() => emit(AuthState.signUp);

  void launchSession(User authCredentials) =>
      sessionCubit.showSession(authCredentials);
}

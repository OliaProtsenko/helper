import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user_data_model.dart';

import '../auth_repository.dart';
import 'session_state.dart';


class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;

  SessionCubit({required this.authRepo}) : super(Authenticated(user: User(fullName: '',email: ''))) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      final user = await authRepo.attemptAutoLogin();
      print(user);
      // (user != null)
      //     ? emit(Authenticated(user: user))
      //     : emit(Unauthenticated());
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void showAuth() => emit(Unauthenticated());

  void showSession(User userCredentials) {
    final user = userCredentials.fullName;
    emit(Authenticated(user: user));
  }


  void signOut() {
    authRepo.signOut();
    emit(Unauthenticated());
  }
}

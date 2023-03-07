import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';


import '../../auth_cubit.dart';
import '../../auth_repository.dart';
import '../../form_submission_status.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc  {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  final _stateController = BehaviorSubject<SignInState>.seeded(SignInState());

  Stream<SignInState> get state => _stateController.stream;

  SignInBloc({required this.authRepo, required this.authCubit});

  Future<void> changeEmail(String email) async{
    final newState=    _stateController.value.copyWith(email:email);
    _stateController.add(newState);
  }

  Future<void> changePassword(String password) async {
    final newState=    _stateController.value.copyWith(password: password);
    _stateController.add(newState);
  }

  Future<void> signInSubmitted() async{
    final state=_stateController.value;
    try {
      final user = await authRepo.login(
        email: state.email,
        password: state.password,
      );
      _stateController.add( state.copyWith(formStatus: SubmissionSuccess()));

      authCubit.launchSession(user);
    } on Exception catch (e) {
      _stateController.add( state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }

}

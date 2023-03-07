import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../auth_cubit.dart';
import '../../auth_repository.dart';
import '../../form_submission_status.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';


abstract class SignUpBloc {
  Stream<SignUpState>get state;

  Future<void> nextStep();

  Future<void> previousStep();

  Future<void> changeUsername(String username);

  Future<void> changeEmail(String email);

  Future<void> changePassword(String password);

  Future<void> signUpSubmitted();

  void dispose();
}

class SignUpBlocImpl extends SignUpBloc {

  final AuthRepository authRepo;
  final AuthCubit authCubit;

  SignUpBlocImpl({required this.authRepo, required this.authCubit});
  final stateController = BehaviorSubject<SignUpState>.seeded(SignUpState());

  @override
  Stream<SignUpState> get state => stateController.stream;

  @override
  Future<void> nextStep() async {
    final nextStepIndex = stateController.value.step.index+1;
    if (nextStepIndex < SignUpStep.values.length) {
      stateController.add(stateController.value.copyWith(step:SignUpStep.values[nextStepIndex]));
    }
    else{
      signUpSubmitted();
    }
  }

  @override
  Future<void> previousStep() async {
    final previousStepIndex = stateController.value.step.index - 1;
    if (previousStepIndex > 0) {
      stateController.add(stateController.value.copyWith(step:SignUpStep.values[previousStepIndex]));
    }
  }

  @override
  void dispose() {
    stateController.close();
  }

  @override
  Future<void> changeEmail(String email) async{
    final newState=    stateController.value.copyWith(email:email);
    stateController.add(newState);
  }

  @override
  Future<void> changePassword(String password) async {
    final newState=    stateController.value.copyWith(password: password);
    stateController.add(newState);
  }

  @override
  Future<void> changeUsername(String username) async{
    final newState=    stateController.value.copyWith(username: username);
    stateController.add(newState);
  }

  @override
  Future<void> signUpSubmitted() async{
    final state=stateController.value;
    try {
      final user = await authRepo.signUp(
        username: state.username,
        email: state.email,
        password: state.password,
      );
      stateController.add( state.copyWith(formStatus: SubmissionSuccess()));

      authCubit.launchSession(user);
    } on Exception catch (e) {
      stateController.add( state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }
}

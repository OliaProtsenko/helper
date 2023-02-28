import 'dart:async';
import 'package:rxdart/rxdart.dart';
enum SignUpStep {
  firstStep,
  secondStep,
  thirdStep,
}

abstract class SignUpBloc {
  Stream<SignUpStep> get state;

  Future<void> nextStep();

  Future<void> previousStep();

  void dispose();
}

class SignUpBlocImpl extends SignUpBloc {
  final stateController = BehaviorSubject<SignUpStep>.seeded(SignUpStep.firstStep);

  @override
  Stream<SignUpStep> get state => stateController.stream;

  @override
  Future<void> nextStep() async {
    final nextStepIndex = stateController.value.index+1;
    if (nextStepIndex < SignUpStep.values.length) {
      stateController.add(SignUpStep.values[nextStepIndex]);
    }
  }

  @override
  Future<void> previousStep() async {
    final previousStepIndex = stateController.value.index - 1;
    if (previousStepIndex > 0) {
      stateController.add(SignUpStep.values[previousStepIndex]);
    }
  }

  @override
  void dispose() {
    stateController.close();
  }
}

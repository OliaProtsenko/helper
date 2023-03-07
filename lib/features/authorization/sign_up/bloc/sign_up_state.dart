import '../../form_submission_status.dart';

class SignUpState {
  final String username;

  bool get isValidUsername => username.length > 3;

  final String email;

  bool get isValidEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  final String password;

  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  final SignUpStep step;
  SignUpState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.step=SignUpStep.firstStep,
    this.formStatus = const InitialFormStatus(),
  });

  SignUpState copyWith({
    String? username,
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
    SignUpStep? step,
  }) {
    return SignUpState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
      step: step?? this.step,
    );
  }
}
enum SignUpStep {
  firstStep,
  secondStep,
  thirdStep,
}
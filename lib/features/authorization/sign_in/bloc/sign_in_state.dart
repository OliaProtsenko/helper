
import '../../form_submission_status.dart';

class SignInState {
  final String email;

  bool get isValidEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  final String password;

  bool get isValidPassword => password.length > 6;
  final FormSubmissionStatus formStatus;

  SignInState(
      {this.email = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  SignInState copyWith(
      {String? email, String? password, FormSubmissionStatus? formStatus}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

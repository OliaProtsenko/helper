import 'package:flutter/material.dart';
import 'package:helper/common/widgets/auth_page_scaffold.dart';
import 'package:helper/common/widgets/four_digit_code_input_widget.dart';
import 'package:provider/provider.dart';

import '../auth_cubit.dart';
import 'bloc/sign_up_bloc.dart';
import 'bloc/sign_up_state.dart';
import 'sign_up_step_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignUpBloc>();
    final theme= Theme.of(context);
    return StreamBuilder<SignUpState>(
        stream: bloc.state,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final state = snapshot.data!;
            return AuthPageScaffold(
              appBarButtonTitle: 'Previous page',
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/image_icon.png',
                        height: 200.0,
                        //  width: double.infinity,
                      ),
                      const SizedBox(height: 30),
                     Text(
                        'Sign Up',
                        style: theme.textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SignUpStepWidget(
                        stepCount: SignUpStep.values.length,
                        activeStepIndex: state.step.index,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        getSubtitle(state.step),
                        style: theme.textTheme.subtitle1,
                      ),
                      const SizedBox(height: 16.0),
                      getCurrentStepForm(state),
                    ],
                  ),
                ),
              ),
              primaryButtonTitle: 'Next',
              onPrimaryButtonTap: () => bloc.nextStep(),
              secondaryButtonTitle: 'Sign in',
              onSecondaryButtonTap: () {
                context.read<AuthCubit>().showLogin();
              },
              onBackButtonTap: state.step == SignUpStep.firstStep
                  ? () => bloc.previousStep()
                  : null,
            );
          }
          return const SizedBox.shrink();
        });
  }

  String getSubtitle(SignUpStep step) {
    switch (step) {
      case SignUpStep.firstStep:
        return 'Tell us a little about yourself. Enter some personal info';
      case SignUpStep.secondStep:
        return 'Please enter the digit code that we’ve just sent to email address';
      case SignUpStep.thirdStep:
        return 'Please enter the digit code that we’ve just sent to email address';
    }
  }

  Widget firstStepForm(SignUpState state) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Full name',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.4,
                  color: Color(0xffe5e3eb),
                ),
              ),
            ),
            validator: (value)=> state.isValidUsername ? null : 'Username is too short',
            onChanged: (value) => context.read<SignUpBloc>().changeUsername(value),
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.4,
                  color: Color(0xffe5e3eb),
                ),
              ),
            ),
            validator: (value) => state.isValidEmail ? null : 'Invalid email',
            onChanged: (value) => context.read<SignUpBloc>().changeEmail(value),
            ),
        ],
      ),
    );
  }

  Widget thirdStepForm(SignUpState state) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.4,
            color: Color(0xffe5e3eb),
          ),
        ),
      ),
      obscureText: true,
      validator: (value) =>
      state.isValidPassword ? null : 'Password is too short',
      onChanged: (value) => context.read<SignUpBloc>().changePassword(value),
    );
  }

  Widget getCurrentStepForm(SignUpState state) {
    switch (state.step) {
      case SignUpStep.firstStep:
        return firstStepForm(state);
      case SignUpStep.secondStep:
        return const FourDigitCodeInput();
      case SignUpStep.thirdStep:
        return thirdStepForm(state);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:helper/common/widgets/auth_page_scaffold.dart';
import 'package:helper/features/authorization/sign_in/bloc/sign_in_state.dart';
import '../auth_cubit.dart';
import '../dimensions.dart';
import 'package:provider/provider.dart';
import 'bloc/sign_in_bloc.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignInBloc>();
    final theme = Theme.of(context);
    return AuthPageScaffold(
      appBarButtonTitle: 'Authorization',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.space16,
        ),
        child: StreamBuilder<SignInState>(
          stream: bloc.state,
          builder: (context, snapshot) {
            final state = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/image_icon.png',
                    height: 200.0,
                    //  width: double.infinity,
                  ),
                  const SizedBox(
                    height: Dimensions.space32,
                  ),
                  Text(
                    'Sign in',
                    style: theme.textTheme.headline2,
                  ),
                  const SizedBox(
                    height: Dimensions.space24,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.4,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                          validator: (value) => state.isValidEmail ? null : 'Email is not valid',
                          onChanged: (value) => bloc.changeEmail(value),
                        ),
                        const SizedBox(height: Dimensions.space12,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.4,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) =>
                          state.isValidPassword ? null : 'Password is incorrect',
                          onChanged: (value) => bloc.changePassword(value),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.space12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t remember your password?',
                        style: theme.textTheme.subtitle1,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Restore it',
                            style: TextStyle(
                              color: Color(0xff82838d),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: -0.4,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ),
      primaryButtonTitle: 'Sign in',
      onPrimaryButtonTap: () =>bloc.signInSubmitted(),
      secondaryButtonTitle: 'Sign up',
      onSecondaryButtonTap: () => context.read<AuthCubit>().showSignUp(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:helper/common/widgets/auth_page_scaffold.dart';
import '../../../common/widgets/primary_button.dart';
import '../dimensions.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AuthPageScaffold(
      appBarButtonTitle: 'Authorization',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.space16,
        ),
        child: SingleChildScrollView(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          //todo: Add regex to check email
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _username = value!;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
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
        ),
      ),
      primaryButtonTitle: 'Sign in',
      onPrimaryButtonTap: () {},
      secondaryButtonTitle: 'Sign up',
      onSecondaryButtonTap: () {},
    );
  }
}

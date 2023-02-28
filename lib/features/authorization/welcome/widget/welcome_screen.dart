import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helper/common/widgets/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/image_icon.png',
              height: 200.0,
              //  width: double.infinity,
            ),
            const SizedBox(height: 50),
            Text(
              'Welcome text!',
              style: theme.textTheme.headline1,
            ),
            const SizedBox(
              height: 50,
            ),
            PrimaryButton(
                title: 'Login',
                onTap: () {
                  Navigator.of(context).pushNamed('/sign_in');
                },
                color: theme.colorScheme.primary),
            const SizedBox(
              height: 15,
            ),
            PrimaryButton(
              title: 'Registration',
              onTap: () => Navigator.of(context).pushNamed('/sign_up'),
              color: theme.colorScheme.primary.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}

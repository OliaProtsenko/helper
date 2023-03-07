import 'package:flutter/material.dart';
import '../../features/authorization/dimensions.dart';

import 'primary_button.dart';

class AuthPageScaffold extends StatelessWidget {
  const AuthPageScaffold({
    Key? key,
    required this.appBarButtonTitle,
    required this.child,
    required this.primaryButtonTitle,
    required this.secondaryButtonTitle,
    required this.onSecondaryButtonTap,
    required this.onPrimaryButtonTap,
    this.onBackButtonTap,
  }) : super(key: key);
  final Widget child;
  final String appBarButtonTitle;
  final String primaryButtonTitle;
  final String secondaryButtonTitle;
  final VoidCallback onPrimaryButtonTap;
  final VoidCallback onSecondaryButtonTap;
  final VoidCallback? onBackButtonTap;
  @override
  Widget build(BuildContext context) {
    final theme= Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: Dimensions.space20),
          onPressed: () =>onBackButtonTap?? Navigator.of(context).maybePop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        leadingWidth: Dimensions.space32,
        titleSpacing: Dimensions.space0,
        title: TextButton(
          onPressed: () => Navigator.of(context).maybePop(),
          child: Text(
            appBarButtonTitle,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: -0.4,
            ),
          ),
        ),
      ),
      body: child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.space20,
                right: Dimensions.space20,
                bottom: Dimensions.space12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(
                      title: primaryButtonTitle,
                      onTap: onPrimaryButtonTap,
                      color: theme.colorScheme.primary,
                    width: double.maxFinite,
                    height:54,),
                  const SizedBox(
                    height: Dimensions.space16,
                  ),
                  PrimaryButton(
                    title: secondaryButtonTitle,
                    onTap: onSecondaryButtonTap,
                    color: theme.colorScheme.primary.withOpacity(0.2),
                    width: double.maxFinite,
                    height:54,
                  ),
                ],
              ),
            ),
    );
  }
}

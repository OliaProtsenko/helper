import 'package:flutter/material.dart';

class SignUpStepWidget extends StatelessWidget {
  const SignUpStepWidget({
    Key? key,
    required this.stepCount,
    required this.activeStepIndex,
  }) : super(key: key);
  final int stepCount;
  final int activeStepIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int index = 0; index < stepCount; index++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            width: 60,
            height: 8,
            decoration: BoxDecoration(
                color: index <= activeStepIndex
                    ? theme.colorScheme.secondaryVariant
                    : Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: theme.colorScheme.secondaryVariant,
                )),
          )
      ],
    ));
  }
}

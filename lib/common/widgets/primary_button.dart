import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key, required this.title, this.color, required this.onTap})
      : super(key: key);
  final Color? color;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme= Theme.of(context);
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        title,
        style: theme.textTheme.button,
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        fixedSize: const Size(
          double.maxFinite,
          54,
        ),
      ),
    );
  }
}

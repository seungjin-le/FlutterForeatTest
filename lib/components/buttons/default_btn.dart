import 'package:flutter/material.dart';

class DefaultBtn extends StatelessWidget {
  const DefaultBtn({super.key, required this.child, required this.onPressed});

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}

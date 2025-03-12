import 'package:flutter/material.dart';

class DefaultBtn extends StatelessWidget {
  const DefaultBtn({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Default Button'),
      onPressed: () {},
    );
  }
}

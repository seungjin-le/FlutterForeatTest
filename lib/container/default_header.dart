import 'package:flutter/material.dart';

class DefaultHeader extends StatelessWidget {
  const DefaultHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        Text('Default Header'),
        Icon(Icons.menu),
      ],
    );
  }
}

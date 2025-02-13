import 'package:flutter/material.dart';

class DefaultFooter extends StatelessWidget {
  const DefaultFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        Text('Footer'),
        Icon(Icons.menu),
      ],
    );
  }
}

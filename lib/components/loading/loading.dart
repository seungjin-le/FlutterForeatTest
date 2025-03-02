import 'package:flutter/material.dart';
import 'package:foreat_mobile/themes/colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsTheme.s400,
      ),
    );
  }
}

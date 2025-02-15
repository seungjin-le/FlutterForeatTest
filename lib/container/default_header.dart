import 'package:flutter/material.dart';
import 'package:foreat_mobile/components/default_text.dart';
import 'package:foreat_mobile/themes/text.dart';

class DefaultHeader extends StatelessWidget {
  const DefaultHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/header/header_back_black.png', width: 40, height: 40),
        const DefaultText(text: 'Header', size: AppTextSize.h4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8,
          children: [
            Image.asset('assets/images/header/header_basket_black.png', width: 40, height: 40),
            Image.asset('assets/images/header/header_basket_black.png', width: 40, height: 40),
          ],
        ),
      ],
    );
  }
}

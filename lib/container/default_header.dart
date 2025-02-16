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
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Image.asset('assets/images/header/header_back_black.png', width: 40, height: 40)],
        )),
        const Expanded(
          child: DefaultText(text: 'HeaderHeaderHeaderHeader', size: AppTextSize.h4, textAlign: TextAlign.center),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Image.asset('assets/images/header/header_basket_black.png', width: 40, height: 40),
              Image.asset('assets/images/header/header_basket_black.png', width: 40, height: 40),
            ],
          ),
        ),
      ],
    );
  }
}

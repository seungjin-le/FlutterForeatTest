import 'package:flutter/material.dart';
import 'package:foreat_mobile/themes/colors.dart';
import 'package:foreat_mobile/themes/text.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle? size;
  final FontWeight? fontWeight;
  final double? height;
  final Color? color;

  const DefaultText(
      {super.key,
      required this.text,
      this.color = ColorsTheme.n80,
      this.textAlign = TextAlign.left,
      this.size = AppTextSize.n2,
      this.fontWeight,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size?.fontSize,
        fontWeight: fontWeight ?? size?.fontWeight,
        height: height ?? size?.height,
        color: color,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';

class ShaderText extends StatelessWidget {
  const ShaderText({super.key, required this.text, this.textSize});
  final String text;
  final double? textSize;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          AppTheme.mainLinearGradien.createShader(bounds),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: Colors.white, fontSize: textSize ?? 36),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '/core/constants/size_config.dart';
import '../../core/themes/app_theme.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key, required this.press, this.width, this.height, this.child, this.buttonImage});

  final VoidCallback press;
  final double? width;
  final double? height;
  final String? buttonImage;

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? getProportionateScreenHeight(60),
      width: width ?? getProportionateScreenWidth(110),
      decoration: BoxDecoration(
          image: buttonImage != null
              ? DecorationImage(image: AssetImage(buttonImage!), fit: BoxFit.cover)
              : null,
          gradient: AppTheme.mainLinearGradien,
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: InputBorder.none,
        onPressed: press,
        child: child,
      
      ),
    );
  }
}

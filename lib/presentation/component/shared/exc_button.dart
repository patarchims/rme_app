import 'package:flutter/material.dart';

import '../res/colors.dart';

class WonsButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? text;
  final double? fontSize;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? color, borderColor, textColor;
  final double height;
  final double width;
  final double? borderRadius;
  const WonsButton(
      {super.key,
      this.onPressed,
      this.child,
      this.text,
      this.fontSize,
      this.color,
      this.borderColor,
      this.textColor,
      this.verticalPadding,
      this.horizontalPadding,
      this.borderRadius,
      required this.height,
      required this.width})
      : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.white,
            elevation: 0.0,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 15,
                horizontal: horizontalPadding ?? 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              side: BorderSide(
                  color: onPressed == null
                      ? Colors.transparent
                      : borderColor ?? color ?? AppColors.background),
            ),
            minimumSize: Size(width, height)),
        child: text != null ? Text(text!, style: buttonTextStyle()) : child);
  }

  buttonTextStyle() {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: fontSize ?? 16,
      color: textColor ?? borderColor ?? Colors.white,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    );
  }
}

Widget visibilityToggle(Function? onToggle, bool isHidden) => InkWell(
      onTap: onToggle != null ? () => onToggle() : null,
      child: Icon(isHidden ? Icons.visibility : Icons.visibility_off,
          color: AppColors.primary),
    );

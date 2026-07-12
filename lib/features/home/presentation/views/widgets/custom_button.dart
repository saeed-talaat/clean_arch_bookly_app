import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backGroundColor,
    this.borderRadius,
    this.fontSize = 18,
  });
  final String text;
  final Color textColor, backGroundColor;
  final BorderRadius? borderRadius;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 48),
        backgroundColor: backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: AppStyles.textStyle18.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

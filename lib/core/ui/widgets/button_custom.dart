import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? height;
  final Color? color;
  final TextStyle? textStyle;

  const ButtonCustom({
    super.key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height = 50,
    this.color,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: AutoSizeText(
          label,
          style: textStyle,
        ),
      ),
    );
  }
}

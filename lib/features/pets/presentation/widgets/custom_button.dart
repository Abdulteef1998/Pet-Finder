import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  // القيم الاختيارية
  final double? width;
  final double? height;
  final double borderRadius;
  final double opacity;
  final double gap;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final Color textColor; // ✅ لون النص
  final double fontSize;
  final double elevation;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 30,
    this.opacity = 1,
    this.gap = 12,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 72),
    this.backgroundColor = const Color(0xFF3DC7B7),
    this.textColor = Colors.white, // ✅ القيمة الافتراضية
    this.fontSize = 16,
    this.elevation = 3,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 54,
      child: Opacity(
        opacity: opacity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Padding(
            padding: EdgeInsets.only(right: gap),
            child: Icon(icon, color: textColor), // أيقونة بنفس لون النص
          ),
          label: Text(
            label,
            style: TextStyle(color: textColor), // ✅ تطبيق لون النص
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            textStyle: TextStyle(fontSize: fontSize),
            elevation: elevation,
          ),
        ),
      ),
    );
  }
}

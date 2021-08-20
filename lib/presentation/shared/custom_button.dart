import 'package:flutter/material.dart';
import 'shared.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback onPressed;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith(
          (states) => Size(100.w, 34.h),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => color ?? const Color(0xffc5337a),
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) => const Color(0xffffffff),
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => TextStyle(fontSize: 14.sp),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

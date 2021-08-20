import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final Widget? suffix;
  final Function(String)? validator;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.suffix,
    this.validator,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.readOnly = false,
    this.maxLines,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      style: TextStyle(
        fontSize: 14.sp,
        color: Theme.of(context).primaryColorDark,
      ),
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: keyboardType,
      controller: controller,
      focusNode: focusNode,
      validator: (value) {
        if (validator != null) {
          return validator!(value ?? "");
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xfff5f5f5f5),
        alignLabelWithHint: true,
        labelText: label,
        hintText: hint,
        suffixIcon: suffix,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: Theme.of(context).primaryColorDark.withOpacity(.4),
        ),
        hintStyle: TextStyle(
          fontSize: 16.sp,
          color: Theme.of(context).primaryColorDark.withOpacity(.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
          ),
          borderRadius: BorderRadius.circular(5.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
          ),
          borderRadius: BorderRadius.circular(5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
          ),
          borderRadius: BorderRadius.circular(5.w),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String)? validator;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final bool readOnly;
  final bool transparent;

  const CustomTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.prefix,
    this.suffix,
    this.validator,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.readOnly = false,
    this.transparent = false,
    this.maxLines,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        prefixIcon: prefix,
        filled: true,
        fillColor: transparent ? Colors.transparent : const Color(0xfff5f5f5f5),
        alignLabelWithHint: true,
        labelText: label,
        hintText: hint,
        suffixIcon: suffix,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: Theme.of(context).primaryColorDark.withOpacity(.4),
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: Theme.of(context).primaryColorDark.withOpacity(.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: transparent
                ? Colors.transparent
                : Theme.of(context).highlightColor,
          ),
          borderRadius: BorderRadius.circular(5.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: transparent
                ? Colors.transparent
                : Theme.of(context).highlightColor,
          ),
          borderRadius: BorderRadius.circular(5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: transparent
                ? Colors.transparent
                : Theme.of(context).highlightColor,
          ),
          borderRadius: BorderRadius.circular(5.w),
        ),
      ),
    );
  }
}

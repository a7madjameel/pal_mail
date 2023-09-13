import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final TextStyle? hintStyle;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final int? maxLines;
  final int? minLines;
  final TextInputAction textInputAction;
  const MyTextField(
      {required this.controller,
      this.hint,
      this.textInputAction = TextInputAction.done,
      this.maxLines,
      this.minLines,
      this.hintStyle,
      this.leadingWidget,
      this.trailingWidget,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      style: hintStyle?.copyWith(color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: hintStyle?.copyWith(
              color: Colors.grey,
            ) ??
            TextStyle(fontSize: 14.sp, color: Colors.grey),
        prefixIcon: leadingWidget,
        suffixIcon: trailingWidget,
      ),
    );
  }
}

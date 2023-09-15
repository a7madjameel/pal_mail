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
  final bool isFilled;
  final bool hasRadius;
  final TextInputType? keyboardType;
  final Function(String text)? onChange;
  final TextInputAction textInputAction;
  const MyTextField(
      {required this.controller,
      this.keyboardType,
      this.hint,
      this.onChange,
      this.hasRadius = false,
      this.isFilled = false,
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
      onChanged: onChange,
      keyboardType: keyboardType ?? TextInputType.text,
      minLines: minLines ?? 1,
      style: hintStyle?.copyWith(color: Colors.black),
      decoration: InputDecoration(
        fillColor: const Color(0xffE6E6E6),
        filled: isFilled,
        enabledBorder: hasRadius ? buildOutlineInputBorder() : InputBorder.none,
        focusedBorder: hasRadius ? buildOutlineInputBorder() : InputBorder.none,
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

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r), borderSide: BorderSide.none);
  }
}

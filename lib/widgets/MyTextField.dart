import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  const MyTextField(
      {required this.controller,
      this.hint,
      this.leadingWidget,
      this.trailingWidget,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        prefixIcon: leadingWidget,
        suffixIcon: trailingWidget,
      ),
    );
  }
}

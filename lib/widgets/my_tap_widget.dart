import 'package:flutter/material.dart';

class MyTapWidget extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  const MyTapWidget({super.key, this.onTap, required this.child});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      splashColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}

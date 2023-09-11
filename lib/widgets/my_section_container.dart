import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySectionContainer extends StatelessWidget {
  final List<Widget> children;
  final double backgroundOpacity;
  const MySectionContainer(
      {required this.children, this.backgroundOpacity = 1, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 12.h,
        top: 16.h,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(backgroundOpacity),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(children: children),
    );
  }
}

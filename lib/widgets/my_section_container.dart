import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySectionContainer extends StatelessWidget {
  final List<Widget>? children;
  final double backgroundOpacity;
  final bool verticalContainer;
  final Widget? paernt;
  const MySectionContainer({
    this.children,
    this.verticalContainer = true,
    this.backgroundOpacity = 1,
    this.onTap,
    this.paernt,
    Key? key,
  }) : super(key: key);
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 16.h,
          top: 16.h,
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(backgroundOpacity),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: paernt ??
            (verticalContainer
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children ?? [])
                : Row(
                    children: children ?? [],
                  )),
      ),
    );
  }
}

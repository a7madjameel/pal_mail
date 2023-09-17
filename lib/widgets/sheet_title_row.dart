import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SheetTitleRow extends StatelessWidget {
  final String title;
  final Function()? onDonePressed;
  const SheetTitleRow({
    super.key,
    required this.title,
    this.onDonePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 18.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: onDonePressed,
          child: Text(
            'Done',
            style: TextStyle(
              fontSize: 18.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

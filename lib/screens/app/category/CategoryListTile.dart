import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/widgets/my_tap_widget.dart';

class CategoryListTile extends StatelessWidget {
  final String title;
  final int itemIndex;
  final int selectedIndex;
  final Function()? onTap;

  const CategoryListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.itemIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return MyTapWidget(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp),
          ),
          selectedIndex == itemIndex
              ? Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                  size: 32.w,
                )
              : SizedBox(height: 32.w),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/tags.dart';

class TagItem extends StatelessWidget {
  final TagItemModel tag;
  const TagItem({required this.tag, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 9.w, bottom: 8.h),
      padding: EdgeInsetsDirectional.only(
          start: 12.w, end: 20.w, top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: tag.selected!
            ? Theme.of(context).colorScheme.primary
            : const Color(0xffE6E6E6),
      ),
      child: Text(
        '#${tag.tag?.name}',
        style: TextStyle(
          color: tag.selected! ? Colors.white : const Color(0xff7C7C7C),
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

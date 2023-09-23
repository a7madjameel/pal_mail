import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyArchiveItem extends StatelessWidget {
  const MyArchiveItem({
    super.key,
    this.image,
    this.subTitle,
    this.title,
    this.isSubHighlited = false,
    this.subWidget,
  });

  final String? title;
  final String? subTitle;
  final String? image;
  final Widget? subWidget;
  final bool isSubHighlited;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset('assets/img/$image'),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title ?? '', style: TextStyle(fontSize: 16.sp)),
            subWidget ??
                Text(
                  subTitle ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isSubHighlited
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black,
                  ),
                ),
          ],
        ),
      ],
    );
  }
}

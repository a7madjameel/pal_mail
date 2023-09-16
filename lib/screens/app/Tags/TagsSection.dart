import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/screens/app/Tags/TagsSheet.dart';
import 'package:pal_mail/widgets/MyTapWidget.dart';
import 'package:pal_mail/widgets/my_section_container.dart';

class TagsSection extends StatefulWidget {
  const TagsSection({super.key});

  @override
  State<TagsSection> createState() => _TagsSectionState();
}

class _TagsSectionState extends State<TagsSection> {
  @override
  Widget build(BuildContext context) {
    return MyTapWidget(
      onTap: () {
        showModalBottomSheet(
          clipBehavior: Clip.antiAlias,
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          useSafeArea: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.r),
            ),
          ),
          builder: (context) {
            return DraggableScrollableSheet(
                initialChildSize: 0.99,
                maxChildSize: 0.99,
                snap: false,
                minChildSize: 0.99,
                expand: true,
                builder: (context, scrollController) {
                  return TagsSheet(scrollController: scrollController);
                });
          },
        );
      },
      child: MySectionContainer(
        verticalContainer: false,
        children: [
          Text(
            '#',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 18.w),
          Text('Tags', style: TextStyle(fontSize: 16.sp)),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.h,
          ),
          SizedBox(width: 18.w),
        ],
      ),
    );
  }
}

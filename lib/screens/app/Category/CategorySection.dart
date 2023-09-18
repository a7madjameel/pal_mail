import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/providers/CategoryProvider.dart';
import 'package:pal_mail/screens/app/Category/CategorySheet.dart';
import 'package:pal_mail/widgets/MyTapWidget.dart';
import 'package:provider/provider.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, value, _) {
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
                    return CategorySheet(selectedIndex: value.getIndex());
                  });
            },
          );
        },
        child: Row(
          children: <Widget>[
            SizedBox(width: 16.w),
            Text(
              'Category',
              style: TextStyle(fontSize: 16.sp),
            ),
            const Spacer(),
            Text(
              value.getData() ?? 'other',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(width: 12.w),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16.w,
            ),
            SizedBox(width: 16.w),
          ],
        ),
      );
    });
  }
}

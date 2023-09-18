import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/providers/CategoryProvider.dart';
import 'package:pal_mail/screens/app/Category/CategoryListTile.dart';
import 'package:pal_mail/widgets/my_section_container.dart';
import 'package:provider/provider.dart';

import '../../../widgets/sheet_title_row.dart';

class CategorySheet extends StatefulWidget {
  final int selectedIndex;
  const CategorySheet({required this.selectedIndex, super.key});

  @override
  State<CategorySheet> createState() => _CategorySheetState();
}

class _CategorySheetState extends State<CategorySheet> {
  late int selectedIndex = widget.selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, value, _) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            SheetTitleRow(
              title: 'Category',
              onDonePressed: () {
                value.setData(selectedIndex);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 58.h),
            MySectionContainer(
              children: [
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CategoryListTile(
                    title: value.items[index],
                    itemIndex: index,
                    selectedIndex: selectedIndex,
                    onTap: () => setState(() {
                      selectedIndex = index;
                    }),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    height: 30.h,
                    thickness: 1.h,
                    indent: 20.w,
                  ),
                  itemCount: 4,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

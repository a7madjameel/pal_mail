import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/screens/app/Tags/add_tags.dart';
import 'package:pal_mail/screens/app/Tags/tags_list.dart';
import 'package:pal_mail/widgets/sheet_title_row.dart';

class TagsSheet extends StatefulWidget {
  final ScrollController scrollController;
  const TagsSheet({required this.scrollController, super.key});

  @override
  State<TagsSheet> createState() => _TagsSheetState();
}

class _TagsSheetState extends State<TagsSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: Column(
          children: [
            const SheetTitleRow(title: 'Tags'),
            SizedBox(height: 56.h),
            const TagsList(),
            SizedBox(height: 12.h),
            const AddTags(),
          ],
        ),
      ),
    );
  }
}

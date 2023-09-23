import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/providers/TagsProvider.dart';
import 'package:pal_mail/screens/app/Tags/AddTags.dart';
import 'package:pal_mail/screens/app/Tags/TagsList.dart';
import 'package:pal_mail/widgets/sheet_title_row.dart';
import 'package:provider/provider.dart';

class TagsSheet extends StatefulWidget {
  final ScrollController scrollController;
  const TagsSheet({required this.scrollController, super.key});

  @override
  State<TagsSheet> createState() => _TagsSheetState();
}

class _TagsSheetState extends State<TagsSheet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TagsProvider>(builder: (context, tagsProv, _) {
      return SingleChildScrollView(
        controller: widget.scrollController,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          child: Column(
            children: [
              SheetTitleRow(
                title: 'Tags',
                onCancelPressed: () {
                  tagsProv.clearSelectedTags();
                  Navigator.pop(context);
                },
                onDonePressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 56.h),
              const TagsList(),
              SizedBox(height: 12.h),
              const AddTags(),
            ],
          ),
        ),
      );
    });
  }
}

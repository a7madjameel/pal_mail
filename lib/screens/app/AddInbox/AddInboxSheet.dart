import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/screens/app/Activity/ActivitySection.dart';
import 'package:pal_mail/screens/app/AddImage/AddImageSection.dart';
import 'package:pal_mail/screens/app/Decision/DecisionSection.dart';
import 'package:pal_mail/screens/app/MailArchive/MailArchive.dart';
import 'package:pal_mail/screens/app/MailTitle/MailTitle.dart';
import 'package:pal_mail/screens/app/Status/StatusSection.dart';
import 'package:pal_mail/screens/app/Tags/TagsSection.dart';

import '../Sender/SenderSection.dart';

class AddInboxSheet extends StatefulWidget {
  final ScrollController scrollController;
  const AddInboxSheet({super.key, required this.scrollController});

  @override
  State<AddInboxSheet> createState() => _AddInboxSheetState();
}

class _AddInboxSheetState extends State<AddInboxSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: widget.scrollController,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                SizedBox(height: 14.h),
                Row(
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
                      'New Inbox',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                //Sender section
                SizedBox(height: 16.h),
                const SenderSection(),
                //Mail title section
                SizedBox(height: 16.h),
                const MailTitle(),
                //Mail Archive Section
                SizedBox(height: 16.h),
                const MailArchive(),
                // tags Section
                SizedBox(height: 20.h),
                const TagsSection(),
                //Status Section
                SizedBox(height: 16.h),
                const StatusSection(),
                //Decision Section
                SizedBox(height: 16.h),
                const DecisionSection(),
                //Add image section
                SizedBox(height: 16.h),
                const AddImageSection(),
                //Activity section
                SizedBox(height: 16.h),
                const ActivitySection(),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

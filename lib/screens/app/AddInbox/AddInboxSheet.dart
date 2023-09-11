import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/screens/app/MailTitle/MailTitle.dart';

import '../Sender/SenderSection.dart';

class AddInboxSheet extends StatefulWidget {
  const AddInboxSheet({super.key});

  @override
  State<AddInboxSheet> createState() => _AddInboxSheetState();
}

class _AddInboxSheetState extends State<AddInboxSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}

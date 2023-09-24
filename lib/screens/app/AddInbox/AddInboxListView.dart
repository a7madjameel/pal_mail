import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/helper.dart';
import '../../../providers/ProvidersManager.dart';
import '../../../widgets/sheet_title_row.dart';
import '../Activity/ActivitySection.dart';
import '../AddImage/AddImageSection.dart';
import '../Decision/DecisionSection.dart';
import '../MailArchive/MailArchiveSection.dart';
import '../MailTitle/MailTitle.dart';
import '../Sender/SenderSection.dart';
import '../Status/StatusSection.dart';
import '../Tags/TagsSection.dart';

class AddInboxListView extends StatefulWidget {
  final ScrollController scrollController;
  const AddInboxListView({required this.scrollController, super.key});

  @override
  State<AddInboxListView> createState() => _AddInboxListViewState();
}

class _AddInboxListViewState extends State<AddInboxListView> with Helper {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
              //Sheet title
              SheetTitleRow(
                title: 'New Inbox',
                onCancelPressed: () {
                  ProvidersManager().resetProvidersOnCancelClicked(context);
                  Navigator.pop(context);
                },
                onDonePressed: () {
                  var validation =
                      ProvidersManager().validateProviders(context);
                  if (validation) {
                    showSnackBar(context,
                        message: 'Inbox created successfully');

                    Navigator.pop(context);
                  } else {
                    showSnackBar(context,
                        message: 'Please enter valid data', success: false);
                  }
                },
              ),
              //Sender section
              SizedBox(height: 16.h),
              const SenderSection(),
              //Mail title section
              SizedBox(height: 16.h),
              const MailTitle(),
              //Mail Archive Section
              SizedBox(height: 16.h),
              const MailArchiveSection(),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/screens/app/MailArchive/ArchiveDateWidget.dart';
import 'package:pal_mail/screens/app/MailArchive/ArchiveNumberWidget.dart';
import 'package:pal_mail/widgets/my_section_container.dart';

class MailArchive extends StatelessWidget {
  const MailArchive({super.key});

  @override
  Widget build(BuildContext context) {
    return MySectionContainer(
      children: [
        const ArchiveDateWidget(),
        Divider(
          height: 30.h,
          indent: 40.w,
          thickness: 1.h,
        ),
        const ArchiveNumberWidget(),
      ],
    );
  }
}

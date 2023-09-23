import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/screens/app/Category/CategorySection.dart';

import '../../../widgets/my_section_container.dart';
import 'SenderWidget.dart';

class SenderSection extends StatelessWidget {
  const SenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MySectionContainer(
      backgroundOpacity: .3,
      children: <Widget>[
        const SenderWidget(),
        Divider(
          height: 24.h,
          thickness: 1.h,
          indent: 16.w,
        ),
        const CategorySection(),
      ],
    );
  }
}

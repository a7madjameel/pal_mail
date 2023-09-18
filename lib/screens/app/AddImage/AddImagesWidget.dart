import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/core/helper/ImagePickerHelper.dart';

import '../../../widgets/MyTapWidget.dart';
import '../../../widgets/my_section_container.dart';

class AddImageWidget extends StatelessWidget with ImagePickerHelper {
  const AddImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyTapWidget(
      onTap: () async => await getMultiImage(context),
      child: MySectionContainer(
        verticalContainer: false,
        children: [
          Text(
            'Add Image',
            style: TextStyle(
                fontSize: 16.sp, color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}

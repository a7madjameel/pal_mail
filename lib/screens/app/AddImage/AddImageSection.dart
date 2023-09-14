import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/widgets/MyTapWidget.dart';
import 'package:pal_mail/widgets/my_section_container.dart';

class AddImageSection extends StatefulWidget {
  const AddImageSection({super.key});

  @override
  State<AddImageSection> createState() => _AddImageSectionState();
}

class _AddImageSectionState extends State<AddImageSection> {
  @override
  Widget build(BuildContext context) {
    return MyTapWidget(
      onTap: () {},
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/widgets/MyTextField.dart';

import '../../../widgets/my_section_container.dart';

class SenderSection extends StatefulWidget {
  const SenderSection({super.key});

  @override
  State<SenderSection> createState() => _SenderSectionState();
}

class _SenderSectionState extends State<SenderSection> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MySectionContainer(
      backgroundOpacity: .3,
      children: <Widget>[
        MyTextField(
          controller: _controller,
          hint: 'Sender',
          leadingWidget: const Icon(Icons.person_outline),
          trailingWidget: Icon(Icons.info_outline,
              color: Theme.of(context).colorScheme.primary),
        ),
        Divider(
          height: 24.h,
          thickness: 1.h,
          indent: 16.w,
        ),
        GestureDetector(
          child: Row(
            children: <Widget>[
              SizedBox(width: 16.w),
              Text(
                'Category',
                style: TextStyle(fontSize: 16.sp),
              ),
              const Spacer(),
              Text(
                'other',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(width: 12.w),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16.w,
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
      ],
    );
  }
}

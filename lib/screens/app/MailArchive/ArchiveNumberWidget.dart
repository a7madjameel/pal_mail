import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/MyTextField.dart';
import 'MyArchiveItem.dart';

class ArchiveNumberWidget extends StatefulWidget {
  const ArchiveNumberWidget({super.key});

  @override
  State<ArchiveNumberWidget> createState() => _ArchiveNumberWidgetState();
}

class _ArchiveNumberWidgetState extends State<ArchiveNumberWidget> {
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
    return MyArchiveItem(
      title: 'Archive Number',
      image: 'archive_icon.svg',
      subWidget: SizedBox(
        width: 300.w,
        height: 24.h,
        child: MyTextField(
          controller: _controller,
          hint: '2022/6019',
          keyboardType: TextInputType.number,
          hintStyle: TextStyle(fontSize: 12.sp),
        ),
      ),
    );
  }
}

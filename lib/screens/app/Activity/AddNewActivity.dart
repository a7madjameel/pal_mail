import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pal_mail/widgets/MyTextField.dart';

class AddNewActivity extends StatefulWidget {
  const AddNewActivity({super.key});

  @override
  State<AddNewActivity> createState() => _AddNewActivityState();
}

class _AddNewActivityState extends State<AddNewActivity> {
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
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xffEEEEF6),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: <Widget>[
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/img/person.svg', width: 24.w),
          ),
          SizedBox(width: 8.w),
          SizedBox(
            width: 290.w,
            height: 50.h,
            child: MyTextField(
              hint: 'Add new Activity …',
              controller: _controller,
            ),
          ),
          const Spacer(),
          SvgPicture.asset('assets/img/submit_activity_icon.svg'),
        ],
      ),
    );
  }
}

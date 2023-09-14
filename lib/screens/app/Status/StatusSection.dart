import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pal_mail/widgets/MyTapWidget.dart';
import 'package:pal_mail/widgets/my_section_container.dart';

class StatusSection extends StatefulWidget {
  const StatusSection({super.key});

  @override
  State<StatusSection> createState() => _StatusSectionState();
}

class _StatusSectionState extends State<StatusSection> {
  @override
  Widget build(BuildContext context) {
    return MyTapWidget(
      onTap: () {},
      child: MySectionContainer(
        verticalContainer: false,
        children: [
          SvgPicture.asset('assets/img/status_icon.svg'),
          SizedBox(width: 18.w),
          Chip(
              label: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Text(
                  'Inbox',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: const Color(0xffFA3A57)),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.h,
          ),
          SizedBox(width: 18.w),
        ],
      ),
    );
  }
}

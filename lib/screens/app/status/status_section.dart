import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pal_mail/providers/statusProvider.dart';
import 'package:pal_mail/screens/app/Status/status_sheet.dart';
import 'package:pal_mail/widgets/my_tap_widget.dart';
import 'package:pal_mail/widgets/my_section_container.dart';
import 'package:provider/provider.dart';

class StatusSection extends StatefulWidget {
  const StatusSection({super.key});

  @override
  State<StatusSection> createState() => _StatusSectionState();
}

class _StatusSectionState extends State<StatusSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StatusProvider>(builder: (context, statusProv, _) {
      return MyTapWidget(
        onTap: () {
          showModalBottomSheet(
            clipBehavior: Clip.antiAlias,
            context: context,
            isDismissible: false,
            isScrollControlled: true,
            useSafeArea: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.r),
              ),
            ),
            builder: (context) {
              return DraggableScrollableSheet(
                  initialChildSize: 0.99,
                  maxChildSize: 0.99,
                  snap: false,
                  minChildSize: 0.99,
                  expand: true,
                  builder: (context, scrollController) {
                    return StatusSheet(
                      scrollController: scrollController,
                      selectedStatus: statusProv.selectedStatus ?? 0,
                    );
                  });
            },
          );
        },
        child: MySectionContainer(
          verticalContainer: false,
          children: [
            SvgPicture.asset('assets/img/status_icon.svg'),
            SizedBox(width: 18.w),
            Chip(
                label: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Text(
                    statusProv
                            .statusList[statusProv.selectedStatus ?? 0].name ??
                        '',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                backgroundColor: Color(
                  int.parse(statusProv
                          .statusList[statusProv.selectedStatus ?? 0].color ??
                      '123123'),
                )),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.h,
            ),
            SizedBox(width: 18.w),
          ],
        ),
      );
    });
  }
}

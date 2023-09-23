import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/models/Status.dart';
import 'package:pal_mail/providers/statusProvider.dart';
import 'package:pal_mail/widgets/my_tap_widget.dart';
import 'package:pal_mail/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

class StatusListTile extends StatelessWidget {
  final Status status;
  final int itemIndex;
  final int selectedIndex;
  final TextEditingController controller;
  final Function()? onTap;
  final Function()? changeColor;

  const StatusListTile({
    required this.controller,
    required this.status,
    required this.selectedIndex,
    required this.itemIndex,
    this.onTap,
    this.changeColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StatusProvider>(builder: (context, statusProv, _) {
      Color color =
          Color(int.parse(statusProv.statusList[itemIndex].color ?? '123123'));
      return MyTapWidget(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            MyTapWidget(
              onTap: changeColor,
              child: Container(
                alignment: Alignment.center,
                height: 32.h,
                width: 32.h,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: controller.text.isEmpty
                    ? const SizedBox.shrink()
                    : Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16.h,
                      ),
              ),
            ),
            SizedBox(width: 16.w),
            controller.text.isEmpty
                ? Text(status.name ?? '')
                : SizedBox(
                    height: 60.h,
                    width: 300.w,
                    child: MyTextField(
                      controller: controller,
                      isFilled: true,
                      hasRadius: true,
                      onSubmit: (value) =>
                          statusProv.editStatus(value, itemIndex),
                    ),
                  ),
            const Spacer(),
            controller.text.isEmpty
                ? selectedIndex == itemIndex
                    ? Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.primary,
                        size: 32.h,
                      )
                    : SizedBox(height: 32.h)
                : SizedBox(height: 32.h),
            SizedBox(width: 22.w),
          ],
        ),
      );
    });
  }
}

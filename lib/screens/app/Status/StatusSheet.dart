import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/models/Status.dart';
import 'package:pal_mail/screens/app/Status/StatusListTile.dart';
import 'package:pal_mail/widgets/my_section_container.dart';
import 'package:pal_mail/widgets/sheet_title_row.dart';

class StatusSheet extends StatefulWidget {
  final ScrollController scrollController;
  const StatusSheet({required this.scrollController, super.key});

  @override
  State<StatusSheet> createState() => _StatusSheetState();
}

class _StatusSheetState extends State<StatusSheet> {
  bool editState = false;
  int selectedIndex = 0;
  List<Status> statusList = List.generate(
      4,
      (index) =>
          Status(color: '0xffFA3A57'.replaceAll('0xff', ''), name: 'Inbox'));

  @override
  Widget build(BuildContext context) {
    late List<TextEditingController> controllers = List.generate(
        statusList.length,
        (index) => TextEditingController(
            text: editState ? statusList[index].name : ''));
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: Column(
          children: [
            const SheetTitleRow(title: 'Status'),
            SizedBox(height: 56.h),
            MySectionContainer(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: IconButton(
                    onPressed: () {
                      if (editState) {
                        for (int i = 0; i < statusList.length; i++) {
                          setState(() {
                            statusList[i].name = controllers[i].text;
                          });
                        }
                      }
                      setState(() => editState = !editState);
                    },
                    icon: Icon(
                      editState ? Icons.check_circle_outline : Icons.edit,
                      color: editState ? Colors.green : const Color(0xffAFAFAF),
                      size: 32.h,
                    ),
                  ),
                ),
                SizedBox(height: 28.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return StatusListTile(
                      status: statusList[index],
                      selectedIndex: selectedIndex,
                      itemIndex: index,
                      onTap: () => setState(() => selectedIndex = index),
                      controller: controllers[index],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 28.h,
                    indent: 67.w,
                    thickness: 1.h,
                  ),
                  itemCount: statusList.length,
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

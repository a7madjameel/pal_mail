import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/providers/statusProvider.dart';
import 'package:pal_mail/screens/app/Status/status_list_tile.dart';
import 'package:pal_mail/widgets/my_section_container.dart';
import 'package:pal_mail/widgets/sheet_title_row.dart';
import 'package:provider/provider.dart';

class StatusSheet extends StatefulWidget {
  final ScrollController scrollController;
  final int selectedStatus;

  const StatusSheet(
      {required this.selectedStatus,
      required this.scrollController,
      super.key});

  @override
  State<StatusSheet> createState() => _StatusSheetState();
}

class _StatusSheetState extends State<StatusSheet> {
  bool editState = false;
  late int selectedIndex = widget.selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Consumer<StatusProvider>(builder: (context, statusProv, _) {
      late List<TextEditingController> controllers = List.generate(
        statusProv.statusList.length,
        (index) => TextEditingController(
          text: editState ? statusProv.statusList[index].name : '',
        ),
      );

      return SingleChildScrollView(
        controller: widget.scrollController,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 14.h,
          ),
          child: Column(
            children: [
              SheetTitleRow(
                  title: 'Status',
                  onDonePressed: () {
                    statusProv.setSelectedStatus(selectedIndex);
                    Navigator.pop(context);
                  }),
              SizedBox(height: 56.h),
              MySectionContainer(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: IconButton(
                      onPressed: () {
                        if (editState) {
                          for (int i = 0;
                              i < statusProv.statusList.length;
                              i++) {
                            setState(() {
                              statusProv.editStatus(controllers[i].text, i);
                            });
                          }
                        }
                        setState(() => editState = !editState);
                      },
                      icon: Icon(
                        editState ? Icons.check_circle_outline : Icons.edit,
                        color:
                            editState ? Colors.green : const Color(0xffAFAFAF),
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
                        status: statusProv.statusList[index],
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
                    itemCount: statusProv.statusList.length,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

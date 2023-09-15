import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pal_mail/widgets/MyTapWidget.dart';
import 'package:pal_mail/widgets/MyTextField.dart';
import 'package:pal_mail/widgets/my_section_container.dart';
import 'package:table_calendar/table_calendar.dart';

class MailArchive extends StatefulWidget {
  const MailArchive({super.key});

  @override
  State<MailArchive> createState() => _MailArchiveState();
}

class _MailArchiveState extends State<MailArchive> {
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

  var date = DateTime.now();
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    var displayDate = DateFormat('EEEE, MMM d , yyyy').format(date).toString();

    return MySectionContainer(
      children: [
        ExpansionPanelList(
          elevation: 0,
          expansionCallback: (panelIndex, isExpanded) =>
              setState(() => expanded = !expanded),
          children: [
            ExpansionPanel(
              isExpanded: expanded,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return MyTapWidget(
                  onTap: () => setState(() => expanded = !expanded),
                  child: MyArchiveItem(
                    title: 'Date',
                    subTitle: displayDate,
                    image: 'date_time_icon.svg',
                    isSubHighlited: true,
                  ),
                );
              },
              body: TableCalendar(
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                focusedDay: date,
                firstDay: DateTime(DateTime.now().year - 1),
                lastDay: DateTime.now(),
                currentDay: date,
                onDaySelected: (selectedDay, focusedDay) =>
                    setState(() => date = selectedDay),
              ),
            ),
          ],
        ),
        Divider(
          height: 30.h,
          indent: 40.w,
          thickness: 1.h,
        ),
        MyArchiveItem(
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
        ),
      ],
    );
  }
}

class MyArchiveItem extends StatelessWidget {
  const MyArchiveItem({
    super.key,
    this.image,
    this.subTitle,
    this.title,
    this.isSubHighlited = false,
    this.subWidget,
  });

  final String? title;
  final String? subTitle;
  final String? image;
  final Widget? subWidget;
  final bool isSubHighlited;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset('assets/img/$image'),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title ?? '', style: TextStyle(fontSize: 16.sp)),
            subWidget ??
                Text(
                  subTitle ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isSubHighlited
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black,
                  ),
                ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/MyTapWidget.dart';
import 'MyArchiveItem.dart';

class ArchiveDateWidget extends StatefulWidget {
  const ArchiveDateWidget({super.key});

  @override
  State<ArchiveDateWidget> createState() => _ArchiveDateWidgetState();
}

class _ArchiveDateWidgetState extends State<ArchiveDateWidget> {
  var date = DateTime.now();
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    var displayDate = DateFormat('EEEE, MMM d , yyyy').format(date).toString();
    return ExpansionPanelList(
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
          body: SizedBox(
            height: 380.h,
            child: TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              focusedDay: date,
              rowHeight: 44.h,
              firstDay: DateTime(DateTime.now().year - 1),
              lastDay: DateTime.now(),
              currentDay: date,
              onDaySelected: (selectedDay, focusedDay) =>
                  setState(() => date = selectedDay),
            ),
          ),
        ),
      ],
    );
  }
}

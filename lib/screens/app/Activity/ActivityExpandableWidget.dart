import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/ActivityModel.dart';

class ActivityExpandableWidget extends StatefulWidget {
  const ActivityExpandableWidget({super.key});

  @override
  State<ActivityExpandableWidget> createState() =>
      _ActivityExpandableWidgetState();
}

class _ActivityExpandableWidgetState extends State<ActivityExpandableWidget> {
  var date = DateTime.now();
  late String displayDate = DateFormat('d MMM yyyy').format(date).toString();

  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    List<ActivityModel> activities = [
      ActivityModel(
        formattedTimeOfActivity: displayDate,
        senderName: 'Ahmed',
        activityContent:
            'test test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test testtest test test',
      )
    ];
    return ExpansionPanelList(
        expandedHeaderPadding: EdgeInsets.zero,
        animationDuration: const Duration(milliseconds: 300),
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            expanded = !isExpanded;
          });
        },
        elevation: 0,
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            isExpanded: expanded,
            headerBuilder: (context, isExpanded) {
              return Text(
                'Activity',
                style: GoogleFonts.poppins(
                    fontSize: 20.sp, fontWeight: FontWeight.w500),
              );
            },
            body: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: activities.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.only(
                    bottom: 25.h,
                    right: 20.w,
                    left: 20.w,
                    top: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            radius: 12.h,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            activities[index].senderName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            activities[index].formattedTimeOfActivity,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 8.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(activities[index].activityContent),
                    ],
                  ),
                );
              },
            ),
          ),
        ]);
  }
}

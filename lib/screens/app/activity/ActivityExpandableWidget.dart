import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail/providers/activityProvider.dart';
import 'package:provider/provider.dart';

class ActivityExpandableWidget extends StatefulWidget {
  const ActivityExpandableWidget({super.key});

  @override
  State<ActivityExpandableWidget> createState() =>
      _ActivityExpandableWidgetState();
}

class _ActivityExpandableWidgetState extends State<ActivityExpandableWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
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
          body: Consumer<ActivityProvider>(builder: (context, activityProv, _) {
            if (activityProv.activities.isEmpty) {
              return Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: const Center(child: Text('No Data')));
            }
            return ListView.builder(
              reverse: true,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: activityProv.activities.length,
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
                            activityProv.activities[index].senderName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            activityProv
                                .activities[index].formattedTimeOfActivity,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 8.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(activityProv.activities[index].activityContent),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

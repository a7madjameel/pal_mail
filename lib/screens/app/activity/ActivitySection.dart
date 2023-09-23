import 'package:flutter/material.dart';
import 'package:pal_mail/screens/app/Activity/ActivityExpandableWidget.dart';
import 'package:pal_mail/screens/app/Activity/AddNewActivity.dart';

class ActivitySection extends StatefulWidget {
  const ActivitySection({super.key});

  @override
  State<ActivitySection> createState() => _ActivitySectionState();
}

class _ActivitySectionState extends State<ActivitySection> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        ActivityExpandableWidget(),
        AddNewActivity(),
      ],
    );
  }
}

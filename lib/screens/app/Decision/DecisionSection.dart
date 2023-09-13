import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/MyTextField.dart';
import '../../../widgets/my_section_container.dart';

class DecisionSection extends StatefulWidget {
  const DecisionSection({super.key});

  @override
  State<DecisionSection> createState() => _DecisionSectionState();
}

class _DecisionSectionState extends State<DecisionSection> {
  late TextEditingController _decisionController;
  @override
  void initState() {
    super.initState();
    _decisionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _decisionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MySectionContainer(
      children: [
        Text(
          'Decision',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        MyTextField(
          controller: _decisionController,
          hint: 'Add Decision…',
          minLines: 1,
          maxLines: 5,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/widgets/MyTextField.dart';
import 'package:pal_mail/widgets/my_section_container.dart';

class MailTitle extends StatefulWidget {
  const MailTitle({super.key});

  @override
  State<MailTitle> createState() => _MailTitleState();
}

class _MailTitleState extends State<MailTitle> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MySectionContainer(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: MyTextField(
            controller: _titleController,
            hint: 'Title of mail',
            hintStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Divider(
          height: 10.h,
          indent: 8.w,
          thickness: 1.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: MyTextField(
            controller: _descriptionController,
            hint: 'Description',
            minLines: 1,
            maxLines: 5,
          ),
        ),
      ],
    );
  }
}
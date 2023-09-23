import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/providers/tagsProvider.dart';
import 'package:pal_mail/widgets/my_text_field.dart';
import 'package:pal_mail/widgets/my_section_container.dart';
import 'package:provider/provider.dart';

class AddTags extends StatefulWidget {
  const AddTags({super.key});

  @override
  State<AddTags> createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
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

  @override
  Widget build(BuildContext context) {
    return Consumer<TagsProvider>(builder: (context, tagsProv, _) {
      return MySectionContainer(
        paernt: MyTextField(
          controller: _controller,
          hint: 'Add New Tag…',
          hintStyle: TextStyle(fontSize: 14.sp),
          onSubmit: (value) {
            tagsProv.addToTags(value);
            _controller.clear();
          },
        ),
      );
    });
  }
}

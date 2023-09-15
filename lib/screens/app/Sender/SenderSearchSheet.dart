import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/models/user_data.dart';
import 'package:pal_mail/widgets/MyTextField.dart';
import 'package:pal_mail/widgets/sheet_title_row.dart';

import 'SearchedUserListTile.dart';

class SenderSearchSheet extends StatefulWidget {
  final ScrollController scrollController;
  const SenderSearchSheet({required this.scrollController, Key? key})
      : super(key: key);

  @override
  _SenderSearchSheetState createState() => _SenderSearchSheetState();
}

class _SenderSearchSheetState extends State<SenderSearchSheet> {
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
    List<User> searchedUsers =
        List.generate(10, (index) => User(name: 'Sender 1'));
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SheetTitleRow(title: 'Sender'),
            SizedBox(height: 18.h),
            MyTextField(
              isFilled: true,
              hasRadius: true,
              controller: _controller,
              hint: 'Username',
              onChange: (text) {
                setState(() {});
              },
              leadingWidget: const Icon(CupertinoIcons.search),
              trailingWidget: GestureDetector(
                onTap: () => _controller.clear(),
                child: Icon(Icons.close, weight: 8.w),
              ),
            ),
            _controller.text.isNotEmpty
                ? Divider(height: 28.h, thickness: 1.h)
                : const SizedBox.shrink(),
            Text(_controller.text.isEmpty ? '' : '"${_controller.text}"'),
            Divider(height: 28.h, thickness: 1.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  SearchedUserListTile(user: searchedUsers[index]),
              separatorBuilder: (context, index) =>
                  Divider(height: 28.h, thickness: 1.h),
              itemCount: searchedUsers.length,
            )
          ],
        ),
      ),
    );
  }
}
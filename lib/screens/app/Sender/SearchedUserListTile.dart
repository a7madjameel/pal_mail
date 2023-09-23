import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/models/Categories.dart';
import 'package:pal_mail/providers/SenderProvider.dart';
import 'package:provider/provider.dart';

class SearchedUserListTile extends StatelessWidget {
  final Sender user;
  const SearchedUserListTile({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SenderProvider>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          value.setData(senderUser: user, senderName: null);
          Navigator.pop(context);
        },
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 24.h,
              backgroundColor: const Color(0xff7C7C7C),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 38.h,
              ),
            ),
            SizedBox(width: 8.w),
            Text(user.name ?? ''),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/controllers/category_controller.dart';
import 'package:pal_mail/core/helper/api_helper.dart';
import 'package:pal_mail/providers/senderProvider.dart';
import 'package:pal_mail/widgets/my_text_field.dart';
import 'package:pal_mail/widgets/sheet_title_row.dart';
import 'package:provider/provider.dart';

import 'searched_user_list_tile.dart';

class SenderSearchSheet extends StatefulWidget {
  final ScrollController scrollController;

  const SenderSearchSheet({required this.scrollController, Key? key})
      : super(key: key);

  @override
  _SenderSearchSheetState createState() => _SenderSearchSheetState();
}

class _SenderSearchSheetState extends State<SenderSearchSheet> {
  late TextEditingController _controller;

  Future<ApiHelper>? data;

  Future<ApiHelper> getData() async {
    dynamic data = await CategoryController().getAllCategories();
    return data['data'];
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 20.w,
        ),
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
            Consumer<SenderProvider>(builder: (context, value, _) {
              return GestureDetector(
                onTap: () {
                  if (_controller.text.isNotEmpty) {
                    value.setData(_controller.text);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  _controller.text.isEmpty ? '' : '"${_controller.text}"',
                ),
              );
            }),
            Divider(height: 28.h, thickness: 1.h),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      var category = snapshot.data![0].categories?[index];
                      return Column(
                        children: [
                          Text(category?.name ?? ''),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                SearchedUserListTile(
                              user: category?.senders?[index].name ?? '',
                            ),
                            separatorBuilder: (context, index) =>
                                Divider(height: 28.h, thickness: 1.h),
                            itemCount: category?.sendersCount as int,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Divider(height: 28.h, thickness: 1.h),
                    itemCount: snapshot.data?.length ?? 0,
                  );
                }
                return const CircularProgressIndicator();
              },
              future: data,
            )
          ],
        ),
      ),
    );
  }
}

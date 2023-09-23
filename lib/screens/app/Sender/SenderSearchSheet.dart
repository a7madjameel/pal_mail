import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/controllers/CategoryController.dart';
import 'package:pal_mail/models/Categories.dart';
import 'package:pal_mail/providers/SenderProvider.dart';
import 'package:pal_mail/widgets/MyTextField.dart';
import 'package:pal_mail/widgets/sheet_title_row.dart';
import 'package:provider/provider.dart';

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
    data = getData();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<Categories>? data;
  Future<Categories> getData() async {
    return await CategoryController().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
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
            Consumer<SenderProvider>(builder: (context, value, _) {
              return GestureDetector(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      value.setData(_controller.text);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                      _controller.text.isEmpty ? '' : '"${_controller.text}"'));
            }),
            Divider(height: 28.h, thickness: 1.h),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var category = snapshot.data!.categories?[index];
                      var senders = snapshot.data!.categories?[index].senders;
                      if (_controller.text.isNotEmpty) {
                        senders = senders
                            ?.where((element) =>
                                element.name!.contains(_controller.text))
                            .toList();
                      }
                      return senders!.isEmpty
                          ? const SizedBox.shrink()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(category?.name ?? ''),
                                Divider(height: 28.h, thickness: 1.h),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      SearchedUserListTile(
                                    user: senders?[index].name ?? '',
                                  ),
                                  separatorBuilder: (context, index) =>
                                      Divider(height: 28.h, thickness: 1.h),
                                  itemCount: senders.length ?? 0,
                                ),
                              ],
                            );
                    },
                    separatorBuilder: (context, index) =>
                        Divider(height: 28.h, thickness: 1.h),
                    itemCount: snapshot.data?.categories?.length ?? 0,
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

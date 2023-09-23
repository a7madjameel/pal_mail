import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/providers/senderProvider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/my_text_field.dart';
import 'sender_search_sheet.dart';

class SenderWidget extends StatefulWidget {
  const SenderWidget({super.key});

  @override
  State<SenderWidget> createState() => _SenderWidgetState();
}

class _SenderWidgetState extends State<SenderWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SenderProvider>(builder: (context, value, _) {
      return MyTextField(
        controller: _controller..text = value.sender ?? '',
        hint: 'Sender',
        hintStyle: TextStyle(fontSize: 16.sp),
        onChange: (x) {
          value.setData(x);
        },
        leadingWidget: const Icon(Icons.person_outline),
        trailingWidget: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              clipBehavior: Clip.antiAlias,
              context: context,
              isDismissible: false,
              isScrollControlled: true,
              useSafeArea: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.r),
                ),
              ),
              builder: (context) {
                return DraggableScrollableSheet(
                    initialChildSize: 0.99,
                    maxChildSize: 0.99,
                    snap: false,
                    minChildSize: 0.99,
                    expand: true,
                    builder: (context, scrollController) {
                      return SenderSearchSheet(
                        scrollController: scrollController,
                      );
                    });
              },
            );
          },
          child: Icon(Icons.info_outline,
              color: Theme.of(context).colorScheme.primary),
        ),
      );
    });
  }
}

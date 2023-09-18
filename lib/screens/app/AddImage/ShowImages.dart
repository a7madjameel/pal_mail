import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/providers/ImageProvider.dart';
import 'package:pal_mail/screens/app/AddImage/ImageView.dart';
import 'package:pal_mail/widgets/my_section_container.dart';
import 'package:provider/provider.dart';

class ShowImages extends StatelessWidget {
  const ShowImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagesProvider>(builder: (context, imageProv, _) {
      var items = List.generate(
          imageProv.images.length + 1,
          (index) => index == imageProv.images.length
              ? const ImageView(index: -1)
              : ImageView(index: index));
      return MySectionContainer(
        paernt: Container(
          alignment: AlignmentDirectional.centerStart,
          child: Wrap(
            runSpacing: 34.w,
            spacing: 34.h,
            children: items,
          ),
        ),
      );
    });
  }
}

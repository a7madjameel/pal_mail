import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/core/helper/ImagePickerHelper.dart';
import 'package:pal_mail/providers/ImageProvider.dart';
import 'package:provider/provider.dart';

class ImageView extends StatelessWidget with ImagePickerHelper {
  final int index;
  const ImageView({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagesProvider>(
      builder: (context, imageProv, child) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: index == -1
                ? Border.all(color: Colors.black, width: 1.w)
                : const Border(),
          ),
          child: index == -1
              ? GestureDetector(
                  onTap: () => getMultiImage(context),
                  child: Icon(Icons.add, size: 44.h))
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red, size: 32.h),
                      onPressed: () => imageProv.removeImage(index),
                    ),
                    Image.file(
                      imageProv.images[index],
                      height: 44.h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pal_mail/core/helper/ImagePickerHelper.dart';
import 'package:pal_mail/screens/app/AddImage/AddImagesWidget.dart';
import 'package:provider/provider.dart';

import '../../../providers/ImageProvider.dart';
import 'ShowImages.dart';

class AddImageSection extends StatefulWidget {
  const AddImageSection({super.key});

  @override
  State<AddImageSection> createState() => _AddImageSectionState();
}

class _AddImageSectionState extends State<AddImageSection>
    with ImagePickerHelper {
  @override
  Widget build(BuildContext context) {
    return Consumer<ImagesProvider>(builder: (context, imageProv, _) {
      return imageProv.images == [] || imageProv.images.isEmpty
          ? const AddImageWidget()
          : const ShowImages();
    });
  }
}

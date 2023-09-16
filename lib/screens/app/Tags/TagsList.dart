import 'package:flutter/material.dart';

import '../../../models/tags.dart';
import '../../../widgets/my_section_container.dart';
import 'TagItem.dart';

class TagsList extends StatefulWidget {
  const TagsList({super.key});

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  @override
  Widget build(BuildContext context) {
    return MySectionContainer(
      paernt: Wrap(
        children: List.generate(
          20,
          (index) => TagItem(
            tag: TagItemModel(
              tag: Tag(name: 'Tag_$index'),
              selected: index % 2 == 0,
            ),
          ),
        ),
      ),
    );
  }
}

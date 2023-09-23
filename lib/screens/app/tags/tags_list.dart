import 'package:flutter/material.dart';
import 'package:pal_mail/providers/tagsProvider.dart';
import 'package:provider/provider.dart';

import '../../../models/tags.dart';
import '../../../widgets/my_section_container.dart';
import 'tag_item.dart';

class TagsList extends StatefulWidget {
  const TagsList({super.key});

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  @override
  Widget build(BuildContext context) {
    return MySectionContainer(
      paernt: Container(
        alignment: AlignmentDirectional.centerStart,
        child: Consumer<TagsProvider>(builder: (context, tagsProv, _) {
          return tagsProv.allTags.isEmpty || tagsProv.allTags == []
              ? const Center(
                  child: Text('No Data'),
                )
              : Wrap(
                  children: List.generate(
                    tagsProv.allTags.length,
                    (index) => TagItem(
                      index: index,
                      tag: TagItemModel(
                        tag: Tag(name: tagsProv.allTags[index]),
                        selected: tagsProv.selectedTags
                            .contains(tagsProv.allTags[index]),
                      ),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}

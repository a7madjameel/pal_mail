import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/mail.dart';
import '../../../providers/CategoryProvider.dart';
import '../../../providers/mails_provider.dart';
import '../../../widgets/contet_expantion_tile.dart';
import '../../../widgets/custom_expantion_tile.dart';
import 'custom_shimmer.dart';


class ConsumerExpansionTile extends StatelessWidget {
  const ConsumerExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoryProvider, MailProvider>(
        builder: (context, catValue, mailsValue, child) {
          if (catValue.state == CategoryState.loading) {
            return const CategoriesShimmer();
          }
          if (catValue.state == CategoryState.error) {
            return const CategoriesShimmer();
          }

          final categories = catValue.category;

          if (categories != null && catValue.state == CategoryState.complete) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    List<Mails> filteredMails = [];

                    if (mailsValue.state == MailsState.complete) {
                      final mails = mailsValue.allMails;
                      filteredMails = mails!.where((e) {
                        return e.sender?.category!.name == categories[index].name;
                      }).toList();

                      return CustomExpansionTile(
                          title: categories[index].name!,
                          count: filteredMails.length.toString(),
                          child: ListView.separated(
                            itemCount: filteredMails.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ContentExpansionTile(
                                color: filteredMails[index].status != null
                                    ? int.parse(filteredMails[index].status!.color!)
                                    : 0xffFFFF00,
                                title: filteredMails[index].sender!.name!,
                                date: filteredMails[index].createdAt!,
                                subject: filteredMails[index].subject!,
                                description: filteredMails[index].description,
                                tags: filteredMails[index]
                                    .tags!
                                    .map((e) => '#${e.name}   ')
                                    .toList()
                                    .join()
                                    .toString(),
                                photoList: const SizedBox(),
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                              color: Colors.grey,
                            ),
                          ));
                    }
                    return const SizedBox();
                  }),
            );
          } else {
            return const CategoriesShimmer();
          }
        });
  }
}

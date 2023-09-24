import 'package:pal_mail/providers/ActivityProvider.dart';
import 'package:pal_mail/providers/ArchiveProvider.dart';
import 'package:pal_mail/providers/CategoryProvider.dart';
import 'package:pal_mail/providers/DecisionProvider.dart';
import 'package:pal_mail/providers/ImageProvider.dart';
import 'package:pal_mail/providers/SenderProvider.dart';
import 'package:pal_mail/providers/StatusProvider.dart';
import 'package:pal_mail/providers/TagsProvider.dart';
import 'package:pal_mail/providers/TitleAndDescriptionProvider.dart';
import 'package:provider/provider.dart';

class ProvidersManager {
  void resetProvidersOnCancelClicked(context) {
    Provider.of<SenderProvider>(context, listen: false)
        .setData(senderName: null, senderUser: null);
    Provider.of<ActivityProvider>(context, listen: false).resetActivity();
    Provider.of<StatusProvider>(context, listen: false).setSelectedStatus(null);
    Provider.of<CategoryProvider>(context, listen: false).setData(null);
    Provider.of<ImagesProvider>(context, listen: false).clearData();
    Provider.of<TagsProvider>(context, listen: false).clearSelectedTags();
    Provider.of<TitleAndDescriptionProvider>(context, listen: false)
        .setTitle(null);
    Provider.of<TitleAndDescriptionProvider>(context, listen: false)
        .setDescription(null);
    Provider.of<ArchiveProvider>(context, listen: false).setArchiveNum(null);
  }

  Future<void> initProviders(context) async {
    await Provider.of<StatusProvider>(context, listen: false).initList();
    await Provider.of<TagsProvider>(context, listen: false).initList();
  }

  bool validateProviders(context) {
    var senderName = Provider.of<SenderProvider>(context, listen: false).sender;
    var activties =
        Provider.of<ActivityProvider>(context, listen: false).activities;
    var images = Provider.of<ImagesProvider>(context, listen: false).images;
    var tags = Provider.of<TagsProvider>(context, listen: false).selectedTags;
    var senderUser =
        Provider.of<SenderProvider>(context, listen: false).senderFromAPI;
    var title =
        Provider.of<TitleAndDescriptionProvider>(context, listen: false).title;
    var description =
        Provider.of<TitleAndDescriptionProvider>(context, listen: false)
            .description;
    var archiveNumber =
        Provider.of<ArchiveProvider>(context, listen: false).archiveNum;
    var archiveDate = Provider.of<ArchiveProvider>(context, listen: false).date;
    var decision =
        Provider.of<DecisionProvider>(context, listen: false).decision;
    int categoryID =
        (Provider.of<CategoryProvider>(context, listen: false).data ?? 0) + 1;
    int statusID =
        (Provider.of<StatusProvider>(context, listen: false).selectedStatus ??
                0) +
            1;

    if ((senderUser == null && senderName == null) ||
        title == null ||
        archiveNumber == null) {
      return false;
    } else {
      resetProvidersOnCancelClicked(context);
      return true;
    }
  }
}

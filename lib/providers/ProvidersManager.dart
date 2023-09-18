import 'package:pal_mail/providers/ActivityProvider.dart';
import 'package:pal_mail/providers/CategoryProvider.dart';
import 'package:pal_mail/providers/ImageProvider.dart';
import 'package:pal_mail/providers/SenderProvider.dart';
import 'package:pal_mail/providers/StatusProvider.dart';
import 'package:pal_mail/providers/TagsProvider.dart';
import 'package:provider/provider.dart';

class ProvidersManager {
  void resetProvidersOnCancelClicked(context) {
    Provider.of<SenderProvider>(context, listen: false).setData('');
    Provider.of<ActivityProvider>(context, listen: false).resetActivity();
    Provider.of<StatusProvider>(context, listen: false).setSelectedStatus(null);
    Provider.of<CategoryProvider>(context, listen: false).setData(null);
    Provider.of<ImagesProvider>(context, listen: false).clearData();
    Provider.of<TagsProvider>(context, listen: false).clearSelectedTags();
  }

  Future<void> initProviders(context) async {
    await Provider.of<StatusProvider>(context, listen: false).initList();
  }
}

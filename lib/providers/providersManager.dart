// import 'package:pal_mail/providers/activityProvider.dart';
// import 'package:pal_mail/providers/archiveProvider.dart';
// import 'package:pal_mail/providers/categoryProvider.dart';
// import 'package:pal_mail/providers/decisionProvider.dart';
// import 'package:pal_mail/providers/imageProvider.dart';
// import 'package:pal_mail/providers/senderProvider.dart';
// import 'package:pal_mail/providers/statusProvider.dart';
// import 'package:pal_mail/providers/tagsProvider.dart';
// import 'package:pal_mail/providers/titleAndDescriptionProvider.dart';
// import 'package:provider/provider.dart';
//
// import '../core/helper/helper.dart';
//
// class ProvidersManager with Helper {
//   void resetProvidersOnCancelClicked(context) {
//     Provider.of<SenderProvider>(context, listen: false).setData(null);
//     Provider.of<ActivityProvider>(context, listen: false).resetActivity();
//     Provider.of<StatusProvider>(context, listen: false).setSelectedStatus(null);
//     //Provider.of<CategoryProvider>(context, listen: false).setData(null);
//     Provider.of<ImagesProvider>(context, listen: false).clearData();
//     Provider.of<TagsProvider>(context, listen: false).clearSelectedTags();
//     Provider.of<TitleAndDescriptionProvider>(context, listen: false)
//         .setTitle(null);
//     Provider.of<TitleAndDescriptionProvider>(context, listen: false)
//         .setDescription(null);
//     Provider.of<ArchiveProvider>(context, listen: false).setArchiveNum(null);
//   }
//
//   Future<void> initProviders(context) async {
//     await Provider.of<StatusProvider>(context, listen: false).initList();
//   }
//
//   bool validateProviders(context) {
//     var sender = Provider.of<SenderProvider>(context, listen: false).sender;
//     var title =
//         Provider.of<TitleAndDescriptionProvider>(context, listen: false).title;
//     var description =
//         Provider.of<TitleAndDescriptionProvider>(context, listen: false)
//             .description;
//     var archiveNumber =
//         Provider.of<ArchiveProvider>(context, listen: false).archiveNum;
//     var decision =
//         Provider.of<DecisionProvider>(context, listen: false).decision;
//
//     if (sender == null ||
//         title == null ||
//         description == null ||
//         archiveNumber == null ||
//         decision == null) {
//       showSnackBar(context, message: 'Please enter valid data', success: false);
//       print(sender);
//       print(title);
//       print(description);
//       print(archiveNumber);
//       print(decision);
//       return false;
//     } else {
//       showSnackBar(context, message: 'Inbox created successfully');
//       resetProvidersOnCancelClicked(context);
//       return true;
//     }
//   }
// }

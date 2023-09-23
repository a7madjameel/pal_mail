import 'package:flutter/material.dart';
import 'package:pal_mail/screens/app/AddInbox/add_inbox_listview.dart';
import 'package:pal_mail/widgets/loading_view.dart';

import '../../../providers/ProvidersManager.dart';

class AddInboxSheet extends StatefulWidget {
  final ScrollController scrollController;
  const AddInboxSheet({super.key, required this.scrollController});

  @override
  State<AddInboxSheet> createState() => _AddInboxSheetState();
}

class _AddInboxSheetState extends State<AddInboxSheet> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await ProvidersManager()
        .initProviders(context)
        .then((value) => setState(() => loading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const LoadingView()
          : AddInboxListView(scrollController: widget.scrollController),
    );
  }
}

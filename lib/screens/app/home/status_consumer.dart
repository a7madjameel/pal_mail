import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/screens/app/home/status_card.dart';
import 'package:provider/provider.dart';

import '../../../providers/StatusProvider.dart';
import 'custom_shimmer.dart';

class ConsumerStatusProvider extends StatelessWidget {
  const ConsumerStatusProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StatusProvider>(builder: (_, statusProvider, __) {
      if (statusProvider.state == StatusesState.loading) {
        return const GridShimmer();
      }
      final statuses = statusProvider.statuses;

      if (statuses != null && statusProvider.state == StatusesState.complete) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.r,
                childAspectRatio: 181.w / 90.h,
                mainAxisSpacing: 16.r),
            itemBuilder: (context, index) {
              return StatusCard(
                  title: statuses[index].name!,
                  color: int.parse(statuses[index].color!),
                  idCount: statuses[index].mailsCount!.toString());
            },
            itemCount: statuses.length,
          ),
        );
      }
      if (statusProvider.state == StatusesState.error) {
        return const GridShimmer();
      } else {
        return const GridShimmer();
      }
    });
  }
}

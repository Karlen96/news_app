import 'package:flutter/material.dart';
import 'package:news_app_task/widgets/shimmers/shimmer_wrapper.dart';

import '../../constants/dimens.dart';

class LatestItemsShimmer extends StatelessWidget {
  const LatestItemsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (_, i) {
        return ShimmerWrapper(
          child: SizedBox(
            height: 60,
            child: ColoredBox(
              color: Colors.grey.shade200,
            ),
          ),
        );
      },
      separatorBuilder: (_, i) {
        return const SizedBox(height: kVerticalPaddingValue);
      },
    );
  }
}

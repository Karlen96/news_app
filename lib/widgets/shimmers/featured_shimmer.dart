import 'package:flutter/material.dart';
import 'package:news_app_task/widgets/shimmers/shimmer_wrapper.dart';

import '../../constants/constants.dart';
import '../../constants/dimens.dart';

class FeaturedShimmer extends StatelessWidget {
  const FeaturedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, i) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(
            featuredItemsHeight / 2,
          ),
          child: ShimmerWrapper(
            child: SizedBox(
              width: 80,
              height: 80,
              child: ColoredBox(
                color: Colors.grey.shade200,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, i) {
        return const SizedBox(width: kHorizontalPaddingValueLarge);
      },
      itemCount: 5,
    );
  }
}

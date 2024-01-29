import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_task/models/news_model/news_model.dart';

import '../../../constants/constants.dart';
import '../../../constants/dimens.dart';
import '../../../state/featured_news_provider/featured_news_provider.dart';
import '../../../widgets/shimmers/featured_shimmer.dart';
import '../../news_single_page/news_single_page.dart';

class FeaturedNews extends ConsumerWidget {
  const FeaturedNews({super.key});

  void onTapNews({
    required NewsModel newsItem,
    required BuildContext context,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsSinglePage(
          newsItem: newsItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredNewsValues = ref.watch(featuredNewsProvider);

    return SizedBox(
      height: featuredItemsHeight,
      child: featuredNewsValues.news.isEmpty
          ? const FeaturedShimmer()
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return GestureDetector(
                  onTap: () => onTapNews(
                    newsItem: featuredNewsValues.news[i],
                    context: context,
                  ),
                  child: CircleAvatar(
                    radius: featuredItemsHeight / 2,
                    backgroundImage: Image.network(
                      featuredNewsValues.news[i].image,
                      fit: BoxFit.contain,
                    ).image,
                  ),
                );
              },
              separatorBuilder: (_, i) {
                return const SizedBox(width: kHorizontalPaddingValueLarge);
              },
              itemCount: featuredNewsValues.news.length,
            ),
    );
  }
}

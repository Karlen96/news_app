import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_task/models/news_model/news_model.dart';

import '../../../constants/dimens.dart';
import '../../../state/latest_news_provider/latest_news_provider.dart';
import '../../../widgets/shimmers/latest_items_shimmer.dart';
import '../../news_single_page/news_single_page.dart';

class LatestNews extends ConsumerWidget {
  const LatestNews({super.key});

  void onTapNews({
    required WidgetRef ref,
    required NewsModel newsItem,
    required BuildContext context,
  }) {
    ref.read(latestNewsProvider.notifier).makeAsRead(newsItem.id);
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
    final latestNewsValues = ref.watch(latestNewsProvider);

    if (latestNewsValues.news.isEmpty) {
      return const LatestItemsShimmer();
    }

    return SliverList.separated(
      itemCount: latestNewsValues.news.length,
      itemBuilder: (_, i) {
        return ListTile(
          onTap: () => onTapNews(
            ref: ref,
            context: context,
            newsItem: latestNewsValues.news[i],
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: kVerticalPaddingValue,
          ),
          isThreeLine: false,
          leading: CircleAvatar(
            backgroundImage: Image.network(
              latestNewsValues.news[i].image,
              fit: BoxFit.contain,
            ).image,
          ),
          title: Text(
            latestNewsValues.news[i].title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing:
              latestNewsValues.news[i].isRead ? const Icon(Icons.check) : null,
        );
      },
      separatorBuilder: (_, i) {
        return const SizedBox(height: kVerticalPaddingValue);
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_task/pages/news_page/widgets/featured_news.dart';
import 'package:news_app_task/pages/news_page/widgets/latest_news.dart';

import '../../constants/dimens.dart';
import '../../state/latest_news_provider/latest_news_provider.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  void onTapNews({
    required WidgetRef ref,
  }) {
    ref.read(latestNewsProvider.notifier).makeAllToRead();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text('newsPage.news'.tr()),
            actions: [
              TextButton(
                onPressed: () => onTapNews(ref: ref),
                child: const Icon(
                  Icons.checklist,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: kVerticalPaddingValue),
          ),
          const SliverToBoxAdapter(child: FeaturedNews()),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: kHorizontalPaddingValueLarge,
              right: kHorizontalPaddingValueLarge,
              top: kVerticalPaddingValue,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                'newsPage.latestNews'.tr(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const LatestNews(),
          const SliverToBoxAdapter(
            child: SizedBox(height: kBottomNavigationBarHeight),
          ),
        ],
      ),
    );
  }
}

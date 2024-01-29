import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app_task/models/news_model/news_model.dart';

import '../../constants/dimens.dart';

class NewsSinglePage extends StatelessWidget {
  const NewsSinglePage({
    super.key,
    required this.newsItem,
  });

  final NewsModel newsItem;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text('newsPage.newsDetails'.tr()),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: kVerticalPaddingValue),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: kHorizontalPaddingValueLarge,
              right: kHorizontalPaddingValueLarge,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    newsItem.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: kVerticalPaddingValue),
                  Image.network(
                    newsItem.image,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: kVerticalPaddingValue),
                  Text(DateFormat.yMMMd().format(newsItem.publishedAt)),
                  const SizedBox(height: kVerticalPaddingValue),
                  Text(newsItem.description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../http/repositories/news_repository.dart';
import 'featured_news_state.dart';

class FeaturedNewsNotifier extends StateNotifier<FeaturedNewsState> {
  final _repository = NewsRepository();

  FeaturedNewsNotifier() : super(const FeaturedNewsState.initial()) {
    getNews();
  }

  Future<void> getNews() async {
    try {
      final news = await _repository.getNews();

      state = state.copyWith(news: news);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

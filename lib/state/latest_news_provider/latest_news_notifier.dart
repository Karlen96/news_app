import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../http/repositories/news_repository.dart';
import 'latest_news_state.dart';

class LatestNewsNotifier extends StateNotifier<LatestNewsState> {
  final _repository = NewsRepository();

  LatestNewsNotifier() : super(const LatestNewsState.initial()) {
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

  void makeAsRead(index) {
    final item = state.news[index];

    if (item.isRead) {
      return;
    }
    _repository.makeReadById(item.id);
    state.news[index] = item.copyWith(isRead: true);
    state = state.copyWith(news: state.news);
  }

  void makeAllToRead() {
    _repository.makeReadAll();
    state = state.copyWith(
      news: state.news
          .map(
            (e) => e.copyWith(
              isRead: true,
            ),
          )
          .toList(),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'latest_news_notifier.dart';
import 'latest_news_state.dart';

final latestNewsProvider =
    StateNotifierProvider<LatestNewsNotifier, LatestNewsState>((ref) {
  return LatestNewsNotifier();
});

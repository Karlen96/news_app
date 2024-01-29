import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'featured_news_notifier.dart';
import 'featured_news_state.dart';

final featuredNewsProvider = StateNotifierProvider<FeaturedNewsNotifier, FeaturedNewsState>((ref) {
  return FeaturedNewsNotifier();
});

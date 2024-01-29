import 'package:equatable/equatable.dart';
import 'package:news_app_task/models/news_model/news_model.dart';

class FeaturedNewsState extends Equatable {
  final List<NewsModel> news;

  const FeaturedNewsState({
    required this.news,
  });

  const FeaturedNewsState.initial({
    this.news = const [],
  });

  FeaturedNewsState copyWith({
    List<NewsModel>? news,
  }) {
    return FeaturedNewsState(
      news: news ?? this.news,
    );
  }

  @override
  List<Object> get props => [news];
}

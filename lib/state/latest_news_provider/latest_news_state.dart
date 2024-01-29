import 'package:equatable/equatable.dart';
import 'package:news_app_task/models/news_model/news_model.dart';

class LatestNewsState extends Equatable {
  final List<NewsModel> news;

  const LatestNewsState({
    required this.news,
  });

  const LatestNewsState.initial({
    this.news = const [],
  });

  LatestNewsState copyWith({
    List<NewsModel>? news,
  }) {
    return LatestNewsState(
      news: news ?? this.news,
    );
  }

  @override
  List<Object> get props => [news];
}

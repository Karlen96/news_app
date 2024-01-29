class NewsModel {
  final int id;
  final String title;
  final String image;
  final bool isRead;
  final String description;
  final DateTime publishedAt;

  const NewsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.publishedAt,
    this.isRead = false,
  });

  NewsModel copyWith({
    int? id,
    String? title,
    String? image,
    bool? isRead = false,
    String? description,
    DateTime? publishedAt,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      isRead: isRead ?? this.isRead,
      description: description ?? this.description,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }
}

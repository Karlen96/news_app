import 'dart:math';

import 'package:faker/faker.dart';

import '../../models/news_model/news_model.dart';

class NewsRepository {
  Future<List<NewsModel>> getNews() async {
    await Future.delayed(const Duration(seconds: 2));
    // generate mock data
    final faker = Faker();
    final list = List.generate(
      20,
      (i) => NewsModel(
        id: i,
        title: faker.person.name(),
        image: faker.image.image(random: true),
        description: faker.lorem.random.string(min(100, 1000)),
        publishedAt: faker.date.dateTime(minYear: 2024),
      ),
    );

    return list;
  }

  Future<void> makeReadAll() async {
    // make list of news to read
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> makeReadById(int id) async {
    // make news to read
    await Future.delayed(const Duration(seconds: 1));
  }
}

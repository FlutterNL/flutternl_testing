import 'package:flutter_riverpod/all.dart';
import 'package:flutternl_testing/models/news_item.dart';

const newsTitle = "You wouldn't believe what happened!";
const newsMessage = "We just made a widget test 💙";
const newsFilterTitle = 'News';

final testNewsList = [testNewsMessage];

final testNewsMessage = NewsItem(
  title: newsTitle,
  message: newsMessage,
  category: NewsCategory.News,
);

final testNewsProvider = FutureProvider<List<NewsItem>>((ref) async {
  return testNewsList;
});

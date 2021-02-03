import 'package:flutter_riverpod/all.dart';
import 'package:flutternl_testing/models/news_item.dart';

const newsTitle = "You wouldn't believe what happened!";
const newsMessage = "We just made a widget test 💙";
const newsFilterTitle = 'News';

final testNewsList = [testNewsMessage];

final testNewsMessage = NewsItem(
  title: newsTitle,
  message: newsMessage,
  category: NewsCategory.news,
  livestream: false,
  breaking: false,
);

final testNewsProvider = FutureProvider<List<NewsItem>>((ref) async {
  return testNewsList;
});

const testAnnouncementMessage = const NewsItem(
    title: "This is a test announcement",
    message: "Testing testing 1, 2 testing 1, 2...",
    category: NewsCategory.announcement,
    livestream: true,
    breaking: true);

const testMeetupMessage = const NewsItem(
    title: "This is a meetup news item",
    message: "Join us next time!",
    category: NewsCategory.meetup,
    livestream: true,
    breaking: false);


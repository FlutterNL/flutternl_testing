import 'package:flutternl_testing/models/news_item.dart';

class FlutterNlNewsApiClient {
  Future<List<NewsItem>> fetchNews() async {
    await Future.delayed(const Duration(seconds: 3));
    return _veryRealNewsItems;
  }
}

const List<NewsItem> _veryRealNewsItems = <NewsItem>[
  const NewsItem(
    title: 'Start your engines',
    message: 'We will show you how to integrate testing in your app.',
    category: NewsCategory.Meetup,
    livestream: false,
    breaking: false,
  ),
  const NewsItem(
    title: 'New Flutter NL organizer',
    message: 'We are happy to announce René joined our organizers group',
    category: NewsCategory.Announcement,
    livestream: true,
    breaking: true,
  )
];

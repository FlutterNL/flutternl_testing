import 'package:flutternl_testing/models/news_item.dart';

class FlutterNlNewsApiClient {
  Future<List<NewsItem>> fetchNews() async {
    await Future.delayed(const Duration(seconds: 3));
    return _veryRealNewsItems;
  }
}

const List<NewsItem> _veryRealNewsItems = <NewsItem>[
  const NewsItem(
    title: 'Start your testing engines',
    message: 'We will show you how to integrate widget testing in your app.',
    category: NewsCategory.meetup,
    livestream: true,
    breaking: false,
  ),
  const NewsItem(
    title: 'New Flutter NL organizer',
    message: 'We are happy to announce René joined our organizers team',
    category: NewsCategory.announcement,
    livestream: true,
    breaking: true,
  ),
  const NewsItem(
    title: "Let's Google Meet again",
    message: "In March we're hosting another Google Meet meetup with a mystery guest",
    category: NewsCategory.meetup,
    livestream: false,
    breaking: true,
  ),
];

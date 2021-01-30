import 'package:flutter_riverpod/all.dart';
import 'package:flutternl_testing/data/news_api_client.dart';
import 'package:flutternl_testing/models/news_item.dart';

final FlutterNlNewsApiClient _apiClient = FlutterNlNewsApiClient();

final newsFilter = StateProvider<FilterOptions>((ref) => FilterOptions.All);

final allNews = FutureProvider<List<NewsItem>>((ref) async {
  return _apiClient.fetchNews();
});

final filteredNews = FutureProvider<List<NewsItem>>((ref) async {
  var list = await ref.watch(allNews.future);
  var filter = ref.watch(newsFilter).state;
  NewsCategory category;
  switch(filter){
    case FilterOptions.All:
      return list;
      break;
    case FilterOptions.News:
      category = NewsCategory.News;
      break;
    case FilterOptions.Meetup:
      category = NewsCategory.Meetup;
      break;
    case FilterOptions.Announcement:
      category = NewsCategory.Announcement;
      break;
  }
  return list.where((element) => element.category == category).toList();
});
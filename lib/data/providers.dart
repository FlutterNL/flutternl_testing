import 'package:flutter_riverpod/all.dart';
import 'package:flutternl_testing/data/news_api_client.dart';
import 'package:flutternl_testing/models/news_item.dart';

final FlutterNlNewsApiClient _apiClient = FlutterNlNewsApiClient();

final newsFilter = StateProvider<FilterOptions>((ref) => FilterOptions.all);

final allNews = FutureProvider<List<NewsItem>>((ref) async {
  return _apiClient.fetchNews();
});

final filteredNews = FutureProvider<List<NewsItem>>((ref) async {
  var list = await ref.watch(allNews.future);
  var filter = ref.watch(newsFilter).state;
  NewsCategory category;
  switch(filter){
    case FilterOptions.all:
      return list;
      break;
    case FilterOptions.news:
      category = NewsCategory.news;
      break;
    case FilterOptions.meetup:
      category = NewsCategory.meetup;
      break;
    case FilterOptions.announcement:
      category = NewsCategory.announcement;
      break;
  }
  return list.where((element) => element.category == category).toList();
});
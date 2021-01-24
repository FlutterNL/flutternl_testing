import 'package:flutter_riverpod/all.dart';
import 'package:flutternl_testing/data/news_api_client.dart';
import 'package:flutternl_testing/models/news_item.dart';

final FlutterNlNewsApiClient _apiClient = FlutterNlNewsApiClient();

// final newsFilter = StateProvider<NewsCategory>((ref) => null);
//
// final allNews = FutureProvider<List<NewsItem>>((ref) async {
//   return _apiClient.fetchNews();
// });
//
// final filteredNews = FutureProvider<List<NewsItem>>((ref) async {
//   var list = await ref.watch(allNews.future);
//   var filter = ref.watch(newsFilter).state;
//   if (filter == null) return list;
//   return list.where((element) => element.category == filter).toList();
// });
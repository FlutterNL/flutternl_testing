import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternl_testing/components/error_icon.dart';
import 'package:flutternl_testing/components/loading_indicator.dart';
import 'package:flutternl_testing/components/news_widget.dart';
import 'package:flutternl_testing/data/news_api_client.dart';
import 'package:flutternl_testing/data/providers.dart';
import 'package:flutternl_testing/models/news_item.dart';

class NewsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(filteredNews).when(
      data: (newsItems) => _NewsListContent(newsItems: newsItems),
      loading: () => LoadingIndicator(),
      error: (error, trace) => ErrorIcon(),
    );
  }
}

class OldNewsList extends StatelessWidget {
  final FlutterNlNewsApiClient _apiClient = FlutterNlNewsApiClient();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsItem>>(
        future: _apiClient.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorIcon();
          }
          if (!snapshot.hasData) {
            return LoadingIndicator();
          }
          return _NewsListContent(newsItems: snapshot.data);
        });
  }
}

class _NewsListContent extends StatelessWidget {
  final List<NewsItem> newsItems;

  const _NewsListContent({Key key, @required this.newsItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (newsItems.isEmpty) {
      return Center(child: Text('No news'));
    }

    return ListView.separated(
        itemBuilder: (context, index) => NewsWidget(newsItem: newsItems[index]),
        separatorBuilder: (context, index) => SizedBox(height: 4.0),
        itemCount: newsItems.length);
  }
}

import 'package:flutter/material.dart';
import 'package:flutternl_testing/components/error_icon.dart';
import 'package:flutternl_testing/components/loading_indicator.dart';
import 'package:flutternl_testing/components/news_widget.dart';
import 'package:flutternl_testing/data/news_api_client.dart';
import 'package:flutternl_testing/models/news_item.dart';

class NewsList extends StatelessWidget {
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
          if(snapshot.data.isEmpty){
            return Center(child: Text('No news'));
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
    return ListView.separated(
        itemBuilder: (context, index) => NewsWidget(newsItem: newsItems[index]),
        separatorBuilder: (context, index) => Divider(),
        itemCount: newsItems.length);
  }
}

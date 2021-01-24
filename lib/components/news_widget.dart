import 'package:flutter/material.dart';
import 'package:flutternl_testing/models/news_item.dart';

class NewsWidget extends StatelessWidget {
  final NewsItem newsItem;

  const NewsWidget({Key key, @required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(newsItem.title, style: Theme.of(context).textTheme
            .headline5,),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Text(newsItem.message),
      ),
    ]);
  }
}

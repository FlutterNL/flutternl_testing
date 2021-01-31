import 'package:flutter/material.dart';
import 'package:flutternl_testing/models/news_item.dart';

import 'news_labels_row.dart';

class NewsWidget extends StatelessWidget {
  final NewsItem newsItem;

  const NewsWidget({Key key, @required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '${newsItem.category == NewsCategory.Announcement ? '📢 ' : ''}${newsItem.title}',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(newsItem.message, style: Theme.of(context).textTheme.caption),
        if (newsItem.livestream || newsItem.breaking) NewsLabelsRow(newsItem: newsItem),
      ]),
    );
  }
}

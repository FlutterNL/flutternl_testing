import 'package:flutter/material.dart';
import 'package:flutternl_testing/models/news_item.dart';

import 'news_labels_row.dart';

class NewsWidget extends StatelessWidget {
  final NewsItem newsItem;

  const NewsWidget({Key key, @required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Visibility(
                  visible: newsItem.category == NewsCategory.Announcement,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(Icons.announcement_rounded, color: Colors.blue),
                  )),
              Expanded(
                child: Text(
                  newsItem.title,
                  style: Theme.of(context).textTheme.headline5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Text(newsItem.message, style: Theme.of(context).textTheme.caption),
          if (newsItem.livestream || newsItem.breaking) NewsLabelsRow(newsItem: newsItem),
        ],
      ),
    );
  }
}

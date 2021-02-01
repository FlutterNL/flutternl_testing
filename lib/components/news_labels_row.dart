import 'package:flutter/material.dart';
import 'package:flutternl_testing/models/news_item.dart';

class NewsLabelsRow extends StatelessWidget {
  const NewsLabelsRow({
    Key key,
    @required this.newsItem,
  }) : super(key: key);

  final NewsItem newsItem;

  @override
  Widget build(BuildContext context) {
    var labelStyle = Theme.of(context)
        .textTheme
        .caption
        .copyWith(color: Colors.black, fontWeight: FontWeight.bold);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (newsItem.breaking)
          Row(
            children: [
              Text(
                'BREAKING',
                style: labelStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(Icons.new_releases_outlined, size: 12),
              )
            ],
          ),
        if (newsItem.livestream)
          Text(
            'LIVESTREAM',
            style: labelStyle.copyWith(color: Colors.red),
          ),
      ],
    );
  }
}

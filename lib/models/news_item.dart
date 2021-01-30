import 'package:flutter/widgets.dart';

class NewsItem {
  final String title;
  final String message;
  final NewsCategory category;

  const NewsItem({
    @required this.title,
    @required this.message,
    @required this.category,
  });
}

enum NewsCategory {
  News,
  Meetup,
  Announcement,
}

enum FilterOptions{
  All,
  News,
  Meetup,
  Announcement,
}
import 'package:flutter/widgets.dart';

class NewsItem {
  final String title;
  final String message;
  final NewsCategory category;
  final bool livestream;
  final bool breaking;

  const NewsItem({
    @required this.title,
    @required this.message,
    @required this.category,
    @required this.livestream,
    @required this.breaking,
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
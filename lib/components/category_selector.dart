import 'package:flutter_riverpod/all.dart';
import 'package:flutter/material.dart';
import 'package:flutternl_testing/data/providers.dart';
import 'package:flutternl_testing/models/news_item.dart';

final filterWidgetKey = UniqueKey();

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsCategory filter;

    return Container(
      width: double.infinity,
      child: PopupMenuButton(
        key: filterWidgetKey,
        initialValue: filter,
        onSelected: (value) {},
        itemBuilder: (context) => [null, ...NewsCategory.values]
            .map((e) => PopupMenuItem(
                key: ValueKey(e),
                child: CategorySelectorItem(option: e),
                value: e))
            .toList(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CategorySelectorItem(
            option: filter,
          ),
        ),
      ),
      color: Colors.white,
    );
  }
}

class CategorySelectorItem extends StatelessWidget {
  final NewsCategory option;

  const CategorySelectorItem({Key key, @required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = "";
    if (option == null) {
      title = 'All';
    } else {
      switch (option) {
        case NewsCategory.News:
          title = 'News';
          break;
        case NewsCategory.Meetup:
          title = 'Meetups';
          break;
        case NewsCategory.Announcement:
          title = 'Announcements';
          break;
      }
    }
    return Text(title);
  }
}

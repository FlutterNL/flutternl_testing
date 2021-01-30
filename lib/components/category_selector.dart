import 'package:flutter_riverpod/all.dart';
import 'package:flutter/material.dart';
import 'package:flutternl_testing/data/providers.dart';
import 'package:flutternl_testing/models/news_item.dart';

final filterWidgetKey = UniqueKey();


class CategorySelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    FilterOptions filter = watch(newsFilter).state;

    return Container(
      width: double.infinity,
      child: PopupMenuButton(
        key: filterWidgetKey,
        initialValue: filter,
        onSelected: (value) {
          context.read(newsFilter).state = value;
        },
        itemBuilder: (context) => FilterOptions.values
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
  final FilterOptions option;

  const CategorySelectorItem({Key key, @required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = "";
    switch (option) {
      case FilterOptions.News:
        title = 'News';
        break;
      case FilterOptions.Meetup:
        title = 'Meetups';
        break;
      case FilterOptions.Announcement:
        title = 'Announcements';
        break;
      case FilterOptions.All:
        title = 'All';
        break;
    }
    return Text(title);
  }
}


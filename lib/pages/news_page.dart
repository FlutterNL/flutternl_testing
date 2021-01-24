import 'package:flutter/material.dart';
import 'package:flutternl_testing/collections/news_list.dart';
import 'package:flutternl_testing/components/category_selector.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategorySelector(),
          Expanded(child: NewsList()),
        ],
      ),
    );
  }
}

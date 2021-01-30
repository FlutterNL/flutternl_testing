// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutternl_testing/components/category_selector.dart';
import 'package:flutternl_testing/data/providers.dart';

import 'package:flutternl_testing/main.dart';
import 'package:flutternl_testing/models/news_item.dart';

import 'test_data.dart';

void main() {
  testWidgets('Test news', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(
      overrides: [allNews.overrideWithProvider(testNewsProvider)],
      child: MyApp(),
    ));

    await tester.pump();

    expect(find.text(newsTitle), findsOneWidget);
  });

  testWidgets('Test filter', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(
      overrides: [allNews.overrideWithProvider(testNewsProvider)],
      child: MyApp(),
    ));

    await tester.pump();
    expect(find.text(newsTitle), findsOneWidget);
    expect(find.text(newsFilterTitle), findsNothing);

    final filter = find.byKey(filterWidgetKey);

    await tester.tap(filter);
    await tester.pumpAndSettle();

    expect(find.text(newsFilterTitle), findsOneWidget);

    await tester.tap(find.byKey(ValueKey(FilterOptions.Meetup)));
    await tester.pump();

    expect(find.text(newsTitle), findsNothing);
  });
}

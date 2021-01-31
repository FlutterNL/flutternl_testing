import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutternl_testing/components/news_widget.dart';

import 'test_data.dart';
import 'test_tools.dart';

void main() {
  testWidgets('Basic golden test', (WidgetTester tester) async {
    // This is a custom helper function to override the default 800x600 screen size
    await tester.setScreenSize(width: 360, height: 640);

    // Create our widget under test
    var newsWidget = NewsWidget(newsItem: testAnnouncementMessage);

    // Renders the UI from the given widget. We have to wrap our NewsWidget in a MaterialApp because
    // our NewsWidget needs a Directionality widget which is a.o. introduced by the MaterialApp
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: newsWidget)));

    // Either try to match the existing golden file or (when run with --update-goldens) create
    // a new golden file from the current screen
    await expectLater(find.byType(NewsWidget), matchesGoldenFile('basic_golden_test.png'));
  });
}

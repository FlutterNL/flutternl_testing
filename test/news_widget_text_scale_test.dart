import 'package:flutter_test/flutter_test.dart';
import 'package:flutternl_testing/components/news_widget.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'test_data.dart';
import 'test_tools.dart';

void main() {
  testGoldens('NewsWidget text scale test', (WidgetTester tester) async {
    // Create an instance of your widget with a given state
    const widget = NewsWidget(newsItem: testAnnouncementMessage);

    // Create a builder and add our text scale scenarios
    final builder = GoldenBuilder.column()
      ..addScenario('Text scale 1.0x', widget)
      ..addTextScaleScenario('Text scale', widget, textScaleFactor: 1.6)
      ..addTextScaleScenario('Text scale', widget, textScaleFactor: 2.0);

    await tester.pumpWidgetBuilder(builder.build(), surfaceSize: ScreenSizes.iphone11);

    await screenMatchesGolden(tester, 'news_widget_text_scale_test');
  });
}

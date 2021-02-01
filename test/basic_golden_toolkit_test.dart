import 'package:flutter_test/flutter_test.dart';
import 'package:flutternl_testing/components/news_widget.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'test_data.dart';
import 'test_tools.dart';

void main() {
  // Instead of testWidgets use testGoldens
  testGoldens('Basic golden toolkit test', (WidgetTester tester) async {

    // Create an instance of your widget with a given state
    const widget = NewsWidget(newsItem: testAnnouncementMessage);

    // Create a builder and add scenarios (you can add more than one)
    final builder = GoldenBuilder.column()..addScenario('Basic golden toolkit test', widget);

    // Use the GoldenBuilder to build a widget for testing
    // Note we use `pumpWidgetBuilder` which is an extension on WidgetTest, provided by the
    // golden_toolkit package. This allows us to add an optional (widget) wrapper and add
    // a surface size we'd like to pump this widget in.
    await tester.pumpWidgetBuilder(builder.build(), surfaceSize: ScreenSizes.iphone11);

    // Use the golden_toolkit's screenMatchesGolden here
    await screenMatchesGolden(tester, 'basic_golden_toolkit_test');
  });
}

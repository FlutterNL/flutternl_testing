import 'package:flutter_test/flutter_test.dart';
import 'package:flutternl_testing/components/news_widget.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'test_data.dart';
import 'test_tools.dart';

void main() {
  testGoldens('Test various NewsWidget states test', (WidgetTester tester) async {
    // Create a builder and add all our state variant (left as an exercise ;-)
    final builder = GoldenBuilder.column()
      ..addScenario('Announcement', NewsWidget(newsItem: testAnnouncementMessage))
      ..addScenario('News', NewsWidget(newsItem: testNewsMessage))
      ..addScenario('Meetup', NewsWidget(newsItem: testMeetupMessage));

    await tester.pumpWidgetBuilder(builder.build(), surfaceSize: ScreenSizes.iphone11);

    await screenMatchesGolden(tester, 'news_widget_various_states_test');
  });
}

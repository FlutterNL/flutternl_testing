import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

// Set a custom widget screen size with:
// testWidgets('', (WidgetTester tester) async {
//     await tester.setScreenSize(width: 540, height: 960);
//     await tester.pumpWidget(…)
extension SetScreenSize on WidgetTester {
  Future<void> setScreenSize(
      {double width = 360,
        double height = 640,
        double pixelDensity = 1}) async {
    final size = Size(width, height);
    await this.binding.setSurfaceSize(size);
    this.binding.window.physicalSizeTestValue = size;
    this.binding.window.devicePixelRatioTestValue = pixelDensity;
  }
}

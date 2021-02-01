import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

/// Before a test file is executed, the Flutter test framework will scan up the directory hierarchy, 
/// starting from the directory in which the test file resides, looking for a file named 
/// flutter_test_config.dart. If it finds such a configuration file, the file will be assumed to have 
/// a main method with the following signature:
/// 
/// Future<void> main(FutureOr<void> testMain());
///
/// The test framework will execute that method and pass it the main() method of the test. It is then 
/// the responsibility of the configuration file's main() method to invoke the test's main() method.
/// 
/// More info: https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html
Future<void> testExecutable(FutureOr<void> Function() testMain) =>
    GoldenToolkit.runWithConfiguration(
      () async {
        await loadAppFonts();
        await testMain();
      },
      config: GoldenToolkitConfiguration(
        defaultDevices: const [Device.phone],
      ),
    );

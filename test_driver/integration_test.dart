import 'dart:io';

import 'package:integration_test/integration_test_driver.dart';
import 'package:path/path.dart';

Future<void> main() async {
  final envVars = Platform.environment;
  if(Platform.isAndroid) {
    String adbPath = join(
      envVars['ANDROID_SDK_ROOT'] ?? envVars['ANDROID_HOME']!,
      'platform-tools',
      Platform.isWindows ? 'adb.exe' : 'adb',
    );
    await Process.run(adbPath, [
      'shell',
      'pm',
      'grant',
      'io.enabley',
      'android.permission.POST_NOTIFICATIONS'
    ]);
  }
  integrationDriver();
}

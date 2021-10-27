library elements_tools;

import 'package:elements/src/tools/device.dart';

export 'src/tools/api.dart' show ApiHelper, HTTP_METHOD;
export 'src/tools/device.dart' show DeviceUtils;
export 'src/tools/db.dart' show DB;
export 'src/tools/utils.dart' show Utils, Environment;

class Elements {
  static Future<void> initialize() async {
    await DeviceUtils.initialize();
  }
}

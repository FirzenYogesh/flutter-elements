import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtils {
  static const _defaultUserAgent =
      'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';
  late String _userAgent;

  static late DeviceUtils instance;

  DeviceUtils._();

  static Future<void> initialize() async {
    var deviceInfo = DeviceInfoPlugin();
    DeviceUtils.instance = DeviceUtils._();
    try {
      DeviceUtils.instance._userAgent =
          (await deviceInfo.webBrowserInfo).userAgent ?? _defaultUserAgent;
    } catch (_) {
      DeviceUtils.instance._userAgent = _defaultUserAgent;
    }
    ;
  }

  String get userAgent => _userAgent;

  bool get isMobile => Platform.isIOS || Platform.isAndroid;
}

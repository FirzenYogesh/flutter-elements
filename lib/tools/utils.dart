import 'package:multicast_dns/multicast_dns.dart';
import 'package:flutter/foundation.dart';

enum Environment { DEV, RELEASE }

class Utils {
  /// get ip for hostname
  /// mostly used for android since Bonjour service is not available natively
  /// Other OS can skip it if using hostname.local
  static Future<String> getIpForHostname(String hostname) async {
    String hostIp = "";
    final MDnsClient client = MDnsClient();
    // Start the client with default options.
    await client.start();

    // Get the PTR record for the service.
    await for (final IPAddressResourceRecord record
        in client.lookup<IPAddressResourceRecord>(
            ResourceRecordQuery.addressIPv4(hostname))) {
      hostIp = record.address.address;
      print('Found address (${record.address}).');
    }

    if (hostIp.isEmpty) {
      await for (final IPAddressResourceRecord record
          in client.lookup<IPAddressResourceRecord>(
              ResourceRecordQuery.addressIPv6(hostname))) {
        hostIp = record.address.address;
        print('Found address (${record.address}).');
      }
    }
    client.stop();
    return hostIp;
  }

  /// check the string for falsy
  static bool isFalsy(Object obj) {
    return ["", null, false, 0].contains(obj);
    // return str?.isEmpty ?? true;
  }

  /// check the string for truthy (inverse of isStringEmpty)
  static bool isTruthy(Object obj) {
    return !isFalsy(obj);
    // return str?.isNotEmpty ?? true;
  }

  static String endodedUrl(String component) {
    return Uri.encodeFull(component);
  }

  /// Default values are taken from 'kDebugMode'
  /// Can be overridden by setting value
  static Environment env = kDebugMode ? Environment.DEV : Environment.RELEASE;
}

import 'package:multicast_dns/multicast_dns.dart';

enum Environment { DEV, RELEASE }

class Utils {
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

  static bool isStringEmpty(String str) {
    return ["", null, false, 0].contains(str);
    // return str?.isEmpty ?? true;
  }

  static bool isStringNotEmpty(String str) {
    return !isStringEmpty(str);
    // return str?.isNotEmpty ?? true;
  }

  static String endodedUrl(String component) {
    return Uri.encodeFull(component);
  }

  static Environment env = Environment.DEV;
}

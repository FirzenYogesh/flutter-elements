import 'dart:convert';
import 'utils.dart';
import 'package:http/http.dart' as http;

enum HTTP_METHOD {
  GET,
  HEAD,
  PATCH,
  PUT,
  POST,
  DELETE,
}

abstract class ApiHelper {
  Future<http.Response> request(
    String host,
    HTTP_METHOD method, {
    String scheme = "https",
    int port = 443,
    String path,
    dynamic body,
    String params,
    Map<String, dynamic> query,
    Map<String, String> headers,
    Encoding encoding,
  }) async {
    if (Utils.isFalsy(host)) {
      throw Exception("ApiHelper: Invalid Host");
    }
    Uri uri = Uri(
      host: host,
      path: path,
      queryParameters: query,
      scheme: scheme,
      port: port,
    );
    return requestFromUri(uri, method,
        body: body, headers: headers, encoding: encoding);
  }

  Future<http.Response> requestFromUri(Uri uri, HTTP_METHOD method,
      {dynamic body, Map<String, String> headers, Encoding encoding}) async {
    String url = uri.toString();
    print("Making $method Request to $url");
    http.Response response;
    if (method == HTTP_METHOD.POST) {
      response = await http.post(url,
          body: body, headers: headers, encoding: encoding);
    } else if (method == HTTP_METHOD.PUT) {
      response =
          await http.put(url, body: body, headers: headers, encoding: encoding);
    } else if (method == HTTP_METHOD.DELETE) {
      response = await http.delete(url, headers: headers);
    } else if (method == HTTP_METHOD.PATCH) {
      response = await http.patch(url,
          body: body, headers: headers, encoding: encoding);
    } else if (method == HTTP_METHOD.HEAD) {
      http.head(url, headers: headers);
    } else {
      response = await http.get(url, headers: headers);
    }
    return response;
  }
}

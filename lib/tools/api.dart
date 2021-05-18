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
  /// make request
  /// @param url      the base url [required]
  /// @param method   the http method [required]
  /// @param path     the path of the api endpoint
  /// @param body     body of the request, used for [PUT, POST] requests
  /// @param query    query parameters
  /// @param headers  headers that is needed for the request
  Future<http.Response> request(
    String baseUrl,
    HTTP_METHOD method, {
    String path,
    String body,
    String params,
    Map<String, dynamic> query,
    Map<String, String> headers,
    Encoding encoding,
  }) async {
    String finalizedUrl = "$baseUrl/$path";
    if (Utils.isTruthy(params)) {
      finalizedUrl += "/$params";
    }
    if (Utils.isTruthy(query)) {
      finalizedUrl += "?${Uri(queryParameters: query)}";
    }
    print("Making $method Request to $finalizedUrl");
    http.Response response;
    if (method == HTTP_METHOD.POST) {
      response = await http.post(finalizedUrl,
          body: body, headers: headers, encoding: encoding);
    } else if (method == HTTP_METHOD.PUT) {
      response = await http.put(finalizedUrl,
          body: body, headers: headers, encoding: encoding);
    } else if (method == HTTP_METHOD.DELETE) {
      response = await http.delete(finalizedUrl, headers: headers);
    } else if (method == HTTP_METHOD.PATCH) {
      response = await http.patch(finalizedUrl,
          body: body, headers: headers, encoding: encoding);
    } else if (method == HTTP_METHOD.HEAD) {
      http.head(finalizedUrl, headers: headers);
    } else {
      response = await http.get(finalizedUrl, headers: headers);
    }
    return response;
  }
}

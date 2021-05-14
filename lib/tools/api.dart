import 'package:elements/models/model.dart';
import 'package:elements/tools/utils.dart';
import 'package:http/http.dart' as http;

enum HTTP_METHOD {
  GET,
  PUT,
  POST,
  DELETE,
}

class ApiHelper {
  final String localUrl;
  final String productionUrl;

  ApiHelper(this.localUrl, this.productionUrl);

  /// base url based on the environment; override by setting Utils.env
  String get baseUrl {
    if (Utils.env == Environment.DEV) {
      return localUrl;
    }
    return productionUrl;
  }

  /// make request
  /// @param path     the path of the api endpoint [required]
  /// @param method   the http method [required]
  /// @param body     body of the request, used for [PUT, POST] requests
  /// @param query    query parameters
  /// @param headers  headers that is needed for the request
  Future<http.Response> request(String path, HTTP_METHOD method,
      {String body = "",
      String params = "",
      String query = "",
      Map<String, String> headers}) async {
    String finalizedUrl = "$baseUrl/$path";
    if (params != "") {
      finalizedUrl += "/$params";
    }
    if (query != "") {
      finalizedUrl += "?$query";
    }
    print("Making $method Request to $finalizedUrl");
    http.Response response;
    if (method == HTTP_METHOD.POST) {
      response = await http.post(finalizedUrl, body: body, headers: headers);
    } else if (method == HTTP_METHOD.PUT) {
      response = await http.put(finalizedUrl, body: body, headers: headers);
    } else {
      response = await http.get(finalizedUrl, headers: headers);
    }

    return response;
  }
}

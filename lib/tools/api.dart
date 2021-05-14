import 'dart:convert';

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

  static ApiHelper get(String localUrl, String productionUrl) {
    return ApiHelper(localUrl, productionUrl);
  }

  request(String url, HTTP_METHOD method,
      {String body = "",
      String params = "",
      String query = "",
      Map<String, String> headers}) async {
    String finalizedUrl = url;
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
    if (response.statusCode == 200) {
      print("Response");
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed request [${response.statusCode} (${response.reasonPhrase})]\nUrl: $finalizedUrl');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart';

/// basic model example
class Model {
  int _statusCode;
  String _reasonPhrase;
  String _body;
  Map<String, String> _headers;

  Model(Response response) {
    _statusCode = response.statusCode;
    _reasonPhrase = response.reasonPhrase;
    _body = response.body;
    _headers = response.headers;
  }

  Map<String, dynamic> _getJson() {
    if (_headers["content-type"].contains("application/json")) {
      return json.decode(_body);
    }
    throw UnsupportedError("Model: The response data is not a json type");
  }

  //getters

  /// convert the response data to json
  /// throws UnsupportedError if the content-type is not of the following
  /// ['application/json']
  Map<String, dynamic> get toJson => _getJson();

  /// a boolean to check for request validity
  bool get success => _statusCode >= 200 && _statusCode < 300;

  /// a boolean to check if the request is a redirect, check Model.reason to check the reason
  bool get isRedirected => _statusCode >= 300 && _statusCode < 400;

  /// a boolean to check for request validity, includes error from [4xx-5xx errors]
  /// check Model.reason to check the reason
  bool get failed => _statusCode >= 400;

  /// get the reason phrase of the request
  String get reason => _reasonPhrase;

  /// get the status code of the request
  int get status => _statusCode;

  /// get the raw data of the request
  String get rawData => _body;
}

import 'dart:convert';

class Model {
  final int statusCode;
  final String responseReason;
  final String data;
  final Map<String, String> headers;

  Model(this.statusCode, this.responseReason, this.data, this.headers);

  Map<String, dynamic> get toJson {
    if (headers["content-type"].contains("application/json")) {
      return json.decode(data);
    }
    throw UnsupportedError("Model: The response data is not a json type");
  }

  bool get success {
    return statusCode >= 200 && statusCode < 300;
  }

  bool get failed {
    return statusCode >= 400;
  }
}

import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<http.Response> get(
    Uri uri, {
    Map<String, String>? headers,
  }) {
    return _client.get(uri, headers: headers);
  }

  Future<http.Response> post(
    Uri uri, {
    Map<String, String>? headers,
    Object? body,
  }) {
    return _client.post(uri, headers: headers, body: body);
  }

  Future<http.Response> head(
    Uri uri, {
    Map<String, String>? headers,
  }) {
    return _client.head(uri, headers: headers);
  }

  void dispose() => _client.close();
}
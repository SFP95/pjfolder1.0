import 'package:http/http.dart' as http;

class ApiClient<T> {
  static const String baseUrl = 'https://pre-api.rolegamesystem.alexdev.es/api/v1';
  static const String apiKey = 'jPWCeIZ5/GGRZgN5jnmMaaGBUS1UZvsyXpbS5wilEK6zMjMqzMHQb7kmM9oHDOzNX+Qyi//dZRkLq20HfYaK+162NvrkkxrjtQL1EexklWiLcLFdgwcQTVcjGVR7ebCkKZQAUW7rd3HJ56iALex1cm7fIena5dsiXFLLRWUIElyzabst4zIAVGjwsreo2X9h+POd0/30NQZVphqrxMv1rQ==';

  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    return await http.get(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(headers));
  }

  Future<http.Response> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    var response = await http.post(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(headers), body: body);
    return response;
  }

  Future<http.Response> patch(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    return await http.patch(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(headers), body: body);
  }

  Future<http.Response> put(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    return await http.put(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(headers), body: body);
  }

  Future<http.Response> delete(String endpoint, {Map<String, String>? headers}) async {
    return await http.delete(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(headers));
  }

  Map<String, String> _buildHeaders(Map<String, String>? headers) {
    final Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_BEARER_TOKEN',
      'X-Api-Key': apiKey,
    };

    if (headers != null) {
      defaultHeaders.addAll(headers);
    }

    return defaultHeaders;
  }
}
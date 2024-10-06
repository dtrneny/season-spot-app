import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:season_spot/core/api_client/api_client.dart';

class ApiClientImpl<T> implements ApiClient<T> {
  ApiClientImpl(this.fromJson);

  @override
  late T Function(Map<String, dynamic> data) fromJson;

  @override
  Future<T?> get(Uri uri) async {
    final response = await http.get(uri);
    final jsonResponse = jsonDecode(response.body);
    return fromJson(jsonResponse);
  }
}

abstract class ApiClient<T> {
  late T Function(Map<String, dynamic> data) fromJson;
  Future<T?> get(Uri uri);
}

abstract class ApiServices {
  Future<dynamic> get(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> post(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  });
  Future<dynamic> patch(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  });
  Future<dynamic> delete(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  });
}

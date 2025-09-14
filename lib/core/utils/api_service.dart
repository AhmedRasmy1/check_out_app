import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required Map<String, dynamic> body,
    required String url,
    required String token,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: body.entries.map((e) => "${e.key}=${e.value}").join("&"),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            if (contentType != null) 'Content-Type': contentType,
            ...?headers,
          },
          contentType: contentType ?? Headers.formUrlEncodedContentType,
        ),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        print("❌ Stripe Error Data: ${e.response?.data}");
      }
      rethrow;
    }
  }
}

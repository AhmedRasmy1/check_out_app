import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required Map<String, dynamic> body,
    required String url,
    required String token,
    String? contentType,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            if (contentType != null) 'Content-Type': contentType,
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:developer';

import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';

class PaymobService {
  final ApiService apiService = ApiService();

  // Future<String?> authenticate() async {
  //   final Dio dio = Dio();
  //   const url = "https://accept.paymob.com/api/auth/tokens";
  //   try {
  //     final response = await dio.post(
  //       url,
  //       data: {"api_key": ApiKeys.apiKeyPaymob},
  //     );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final authToken = response.data['token'];
  //       log("✅ Paymob Auth Token: $authToken");
  //       return authToken;
  //     }
  //   } catch (e) {
  //     log("❌ Paymob Authentication Error: $e");
  //   }
  //   return null;
  // }
}

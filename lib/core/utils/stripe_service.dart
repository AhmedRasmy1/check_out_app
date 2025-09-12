import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/core/utils/api_service.dart';
import 'package:check_out_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  //PaymentIntentObject create paymentIntent(String amount, String currency)

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toMap(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
  //init payment sheet (PaymentIntentClientSecret)

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Ahmed',
      ),
    );
  }
  //present payment sheet

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future createPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await displayPaymentSheet();
  }
}

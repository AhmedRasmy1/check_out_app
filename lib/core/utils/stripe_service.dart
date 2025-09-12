import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/core/utils/api_service.dart';
import 'package:check_out_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService;

  StripeService({required this.apiService});
  //PaymentIntentObject create paymentIntent(String amount, String currency)

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final response = await apiService.post(
      body: paymentIntentInputModel.toMap(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
  //init payment sheet (PaymentIntentClientSecret)

  Future initPaymentSheet({required String clientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Ahmed Hisham',
      ),
    );
  }
  //present payment sheet

  Future displayPaymentSheet() {
    return Stripe.instance.presentPaymentSheet();
  }

  Future createPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    await initPaymentSheet(clientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}

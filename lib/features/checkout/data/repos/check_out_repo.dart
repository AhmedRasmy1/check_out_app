import '../../../../core/errors/failure.dart';
import '../models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> createPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}

abstract class PaymobRepo {
  Future<Either<Failure, int>> registerOrder({
    required String authToken,
    required int amountCents,
  });
  Future<Either<Failure, String>> getPaymentKey({
    required String authToken,
    required int amountCents,
    required int orderId,
    required int integrationId,
    required Map<String, dynamic> billingData,
  });
}

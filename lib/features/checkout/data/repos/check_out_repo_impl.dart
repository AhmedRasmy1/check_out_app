import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/stripe_service.dart';
import '../models/payment_intent_input_model.dart';
import 'check_out_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> createPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.createPayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return const Right(null);
    } on StripeException catch (e) {
      return Left(
        ServerFailure(errMessage: e.error.message ?? 'There was an error'),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}

class PaymobRepoImpl extends PaymobRepo {
  final Dio _dio = Dio();
  @override
  Future<Either<Failure, int>> registerOrder({
    required String authToken,
    required int amountCents,
  }) async {
    const url = "https://accept.paymob.com/api/ecommerce/orders";
    try {
      final response = await _dio.post(
        url,
        data: {
          "auth_token": authToken,
          "delivery_needed": "false",
          "amount_cents": amountCents.toString(),
          "currency": "EGP",
          "items": [],
        },
      );
      return Right(response.data['id']);
    } on Exception catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getPaymentKey({
    required String authToken,
    required int amountCents,
    required int orderId,
    required int integrationId,
    required Map<String, dynamic> billingData,
  }) async {
    const url = "https://accept.paymob.com/api/acceptance/payment_keys";
    try {
      final response = await _dio.post(
        url,
        data: {
          "auth_token": authToken,
          "amount_cents": amountCents.toString(),
          "expiration": 3600,
          "order_id": orderId,
          "billing_data": billingData,
          "currency": "EGP",
          "integration_id": integrationId,
        },
      );
      return Right(response.data['token']);
    } on Exception catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}

import 'package:check_out_app/core/errors/failure.dart';
import 'package:check_out_app/core/utils/stripe_service.dart';
import 'package:check_out_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/checkout/data/repos/check_out_repo.dart';
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

import 'package:check_out_app/core/errors/failure.dart';
import 'package:check_out_app/core/utils/stripe_service.dart';
import 'package:check_out_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/checkout/data/repos/check_out_repo.dart';
import 'package:dartz/dartz.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeService stripeService;
  CheckOutRepoImpl({required this.stripeService});
  @override
  Future<Either<Failure, void>> createPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.createPaymentIntent(paymentIntentInputModel);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}

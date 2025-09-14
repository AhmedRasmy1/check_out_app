import '../../../../core/errors/failure.dart';
import '../models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> createPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:check_out_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/checkout/data/repos/check_out_repo.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());

  final CheckOutRepo checkOutRepo;

  Future createPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());
    final result = await checkOutRepo.createPayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    result.fold(
      (failure) => emit(PaymentFailure(errMessage: failure.errMessage)),
      (_) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}

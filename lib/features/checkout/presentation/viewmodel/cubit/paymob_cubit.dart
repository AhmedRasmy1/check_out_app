import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:check_out_app/features/checkout/data/repos/check_out_repo.dart';
import 'package:meta/meta.dart';

part 'paymob_state.dart';

class PaymobCubit extends Cubit<PaymobState> {
  final PaymobRepo paymobRepo;
  PaymobCubit(this.paymobRepo) : super(PaymobInitial());

  Future<void> payWithCard({
    required String authToken,
    required int amountCents,
    required int orderId,
    required int integrationId,
    required Map<String, dynamic> billingData,
  }) async {
    emit(PaymobLoading());
    final orderId = await paymobRepo.registerOrder(
      authToken: authToken,
      amountCents: amountCents,
    );

    final paymentKey = await paymobRepo.getPaymentKey(
      authToken: authToken,
      amountCents: amountCents,
      orderId: orderId.fold((l) => 0, (r) => r),
      integrationId: integrationId,
      billingData: billingData,
    );
    paymentKey.fold(
      (failure) {
        emit(PaymobError(failure.errMessage));
        log('Paymob Failure: ${failure.errMessage}');
      },
      (key) {
        emit(PaymobSuccess(key));
      },
    );
  }
}

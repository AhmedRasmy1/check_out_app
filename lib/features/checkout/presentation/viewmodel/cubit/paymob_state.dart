part of 'paymob_cubit.dart';

@immutable
sealed class PaymobState {}

final class PaymobInitial extends PaymobState {}

class PaymobLoading extends PaymobState {}

class PaymobSuccess extends PaymobState {
  final String paymentKey;
  PaymobSuccess(this.paymentKey);
}

class PaymobError extends PaymobState {
  final String message;
  PaymobError(this.message);
}

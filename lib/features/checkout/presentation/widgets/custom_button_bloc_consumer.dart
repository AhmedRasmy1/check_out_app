import 'package:check_out_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/checkout/presentation/viewmodel/cubit/payment_cubit.dart';
import 'package:check_out_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:check_out_app/features/checkout/presentation/widgets/custom_button_for_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.width,
    required this.height,
    required this.selectedIndex,
    required this.formKey,
    required this.autoValidateMode,
  });

  final double width;
  final double height;
  final int selectedIndex;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ThankYouView()),
          );
        } else if (state is PaymentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Payment Failed: ${state.errMessage}')),
          );
        }
      },
      builder: (context, state) {
        return PaymentMethodButton(
          isLoading: state is PaymentLoading ? true : false,
          width: width * 0.9,
          height: height * 0.090,
          onPressed: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                  amount: '100',
                  currency: 'USD',
                  customerId: 'cus_T2gAyLuJuYCYFi',
                );
            BlocProvider.of<PaymentCubit>(
              context,
            ).createPayment(paymentIntentInputModel: paymentIntentInputModel);
            // if (selectedIndex == 0) {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (_) => CustomCreditCardWidget(
            //         formKey: formKey,
            //         autoValidateMode: autoValidateMode,
            //       ),
            //     ),
            //   );
            // } else if (selectedIndex == 1) {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (_) => const PaypalPage()),
            //   );
            // } else if (selectedIndex == 2) {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (_) => const ApplePayPage()),
            //   );
            // }
          },
          text: 'Choose Payment Method',
        );
      },
    );
  }
}

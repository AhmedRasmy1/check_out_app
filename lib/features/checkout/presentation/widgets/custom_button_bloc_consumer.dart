import 'package:check_out_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/checkout/presentation/viewmodel/cubit/payment_cubit.dart';
import 'package:check_out_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:check_out_app/features/checkout/presentation/widgets/custom_button_for_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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
            if (selectedIndex == 0) {
              // Stripe
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                    amount: '100',
                    currency: 'USD',
                    customerId: 'cus_T2gAyLuJuYCYFi',
                  );
              BlocProvider.of<PaymentCubit>(
                context,
              ).createPayment(paymentIntentInputModel: paymentIntentInputModel);
            } else if (selectedIndex == 1) {
              // Paypal
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId: "",
                    secretKey: "",
                    transactions: const [
                      {
                        "amount": {
                          "total": '70',
                          "currency": "USD",
                          "details": {
                            "subtotal": '70',
                            "shipping": '0',
                            "shipping_discount": 0,
                          },
                        },
                        "description": "The payment transaction description.",
                        "item_list": {
                          "items": [
                            {
                              "name": "Apple",
                              "quantity": 4,
                              "price": '5',
                              "currency": "USD",
                            },
                            {
                              "name": "Pineapple",
                              "quantity": 5,
                              "price": '10',
                              "currency": "USD",
                            },
                          ],
                        },
                      },
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");
                    },
                    onError: (error) {
                      print("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                    },
                  ),
                ),
              );
            } else if (selectedIndex == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(title: const Text('قريباً')),
                    body: const Center(
                      child: Text('سيتم إضافة طريقة الدفع قريباً'),
                    ),
                  ),
                ),
              );
            }
          },
          text: 'Choose Payment Method',
        );
      },
    );
  }
}

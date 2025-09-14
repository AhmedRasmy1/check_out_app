import 'dart:developer';

import '../../../../core/utils/api_keys.dart';
import '../../data/models/amount_model/amount_model.dart';
import '../../data/models/amount_model/details.dart';
import '../../data/models/item_list_model/item.dart';
import '../../data/models/item_list_model/item_list_model.dart';
import '../../data/models/payment_intent_input_model.dart';
import '../viewmodel/cubit/payment_cubit.dart';
import '../views/thank_you_view.dart';
import 'custom_button_for_payment.dart';
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
              executeStripePayment(context);
            } else if (selectedIndex == 1) {
              // Paypal
              var transactionData = getTransactionData();
              executePaypalPayment(context, transactionData);
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

  void executeStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      customerId: 'cus_T2gAyLuJuYCYFi',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).createPayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void executePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paypalClientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionData.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const ThankYouView()),
              (route) {
                if (route.settings.name == '/') {
                  return true;
                } else {
                  return false;
                }
              },
            );
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            log('cancelled:');
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    var amount = AmountModel(
      total: '70',
      currency: 'USD',
      details: Details(subtotal: '70', shipping: '0', shippingDiscount: '0'),
    );

    var itemList = ItemListModel(
      items: [
        Item(name: "Apple", quantity: 4, price: '5', currency: "USD"),
        Item(name: "Pineapple", quantity: 5, price: '10', currency: "USD"),
      ],
    );
    return (amount: amount, itemList: itemList);
  }
}

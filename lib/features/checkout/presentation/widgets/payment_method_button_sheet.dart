import 'package:check_out_app/features/checkout/presentation/views/custom_credit_card.dart';
import 'package:check_out_app/features/checkout/presentation/widgets/custom_button_bloc_consumer.dart';
import 'package:check_out_app/features/checkout/presentation/widgets/select_payment_method.dart';
import 'package:flutter/material.dart';

class PaymentMethodButtonSheet extends StatefulWidget {
  const PaymentMethodButtonSheet({super.key});

  @override
  State<PaymentMethodButtonSheet> createState() =>
      _PaymentMethodButtonSheetState();
}

class _PaymentMethodButtonSheetState extends State<PaymentMethodButtonSheet> {
  int selectedIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final List<String> paymentMethods = [
    "assets/images/card_image.svg",
    "assets/images/paypal_image.svg",
    "assets/images/apple_pay_image.svg",
  ];
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final height = media.size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: height * 0.02,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectPaymentMethod(
            selectedIndex: selectedIndex,
            paymentMethods: paymentMethods,
            onChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          CustomButtonBlocConsumer(
            width: width,
            height: height,
            selectedIndex: selectedIndex,
            formKey: formKey,
            autoValidateMode: autoValidateMode,
          ),
        ],
      ),
    );
  }

  Widget buildSelectedMethodContent() {
    if (selectedIndex == 0) {
      return CustomCreditCardWidget(
        formKey: formKey,
        autoValidateMode: autoValidateMode,
      );
    } else if (selectedIndex == 1) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Pay with PayPal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "PayPal Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Proceed with PayPal"),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          const Text(
            "Pay with Apple Pay",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.apple),
            label: const Text("Pay with Apple Pay"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ),
        ],
      );
    }
  }
}

class PaypalPage extends StatelessWidget {
  const PaypalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PayPal Payment")),
      body: const Center(child: Text("PayPal Payment Page")),
    );
  }
}

class ApplePayPage extends StatelessWidget {
  const ApplePayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apple Pay Payment")),
      body: const Center(child: Text("Apple Pay Payment Page")),
    );
  }
}

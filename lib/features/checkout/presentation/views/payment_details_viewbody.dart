import 'custom_credit_card.dart';
import '../widgets/select_payment_method.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  int selectedIndex = 0;

  final List<String> paymentMethods = [
    "assets/images/card_image.svg",
    "assets/images/paypal_image.svg",
    "assets/images/apple_pay_image.svg",
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final height = media.size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            const SizedBox(height: 20),
            buildSelectedMethodContent(),
          ],
        ),
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

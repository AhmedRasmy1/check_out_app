import 'package:check_out_app/core/utils/styles.dart';
import 'package:check_out_app/features/checkout/presentation/views/custom_credit_card.dart';
import 'package:check_out_app/features/checkout/presentation/views/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final height = media.size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            selectMethod(),
            const SizedBox(height: 20),
            buildSelectedMethodContent(),
          ],
        ),
      ),
    );
  }

  Widget selectMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(paymentMethods.length, (index) {
        bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 103,
            height: 62,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 2,
                color: isSelected ? Colors.green : Colors.grey,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: 12,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SvgPicture.asset(
                  paymentMethods[index],
                  width: 50,
                  height: 30,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildSelectedMethodContent() {
    if (selectedIndex == 0) {
      return const CustomCreditCardWidget();
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

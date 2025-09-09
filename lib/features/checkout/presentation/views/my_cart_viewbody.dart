import 'package:check_out_app/features/checkout/presentation/views/payment_details.dart';
import 'package:flutter/material.dart';

import 'package:check_out_app/core/utils/styles.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final height = media.size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/baskett.png',
                  width: width * 0.9,
                  height: height * 0.51,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: height * 0.02),
              OrderInfoItem(label: 'Order Subtotal', value: '\$42.97'),
              SizedBox(height: height * 0.008),
              OrderInfoItem(label: 'Discount', value: '\$0.0'),
              SizedBox(height: height * 0.008),
              OrderInfoItem(label: 'Shipping', value: '\$8.0'),
              SizedBox(height: height * 0.02),
              Divider(color: Colors.grey, thickness: 2),
              SizedBox(height: height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: Styles.style24),
                  Text('\$50.97', style: Styles.style24),
                ],
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                width: double.infinity,
                height: height * 0.099,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff34a853),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentDetailsView(),
                      ),
                    );
                  },
                  child: Text('Complete Payment', style: Styles.style22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderInfoItem extends Row {
  OrderInfoItem({super.key, required this.label, required this.value})
    : super(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Styles.style18),
          Text(value, style: Styles.style18),
        ],
      );

  final String label;
  final String value;
}

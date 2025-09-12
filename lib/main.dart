import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Check Out App',
      home: const MyCartView(),
    );
  }
}

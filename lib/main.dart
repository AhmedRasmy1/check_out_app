import 'package:check_out_app/features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
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

//PaymentIntentObject create paymentIntent(String amount, String currency)
//init payment sheet (PaymentIntentClientSecret)
//present payment sheet

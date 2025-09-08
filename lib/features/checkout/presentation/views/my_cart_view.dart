import 'package:check_out_app/core/utils/styles.dart';
import 'package:check_out_app/features/checkout/presentation/views/my_cart_viewbody.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Cart', style: Styles.style25),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: MyCartViewBody(),
    );
  }
}

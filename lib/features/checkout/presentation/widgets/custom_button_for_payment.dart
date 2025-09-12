import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PaymentMethodButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  const PaymentMethodButton({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff34a853),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator()
            : Text(text, style: Styles.style22),
      ),
    );
  }
}

import 'dart:developer';

import 'package:check_out_app/core/utils/styles.dart';
import 'package:check_out_app/features/checkout/presentation/views/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCardWidget extends StatefulWidget {
  CustomCreditCardWidget({
    required this.formKey,
    required this.autoValidateMode,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  AutovalidateMode autoValidateMode;

  @override
  State<CustomCreditCardWidget> createState() => _CustomCreditCardWidgetState();
}

class _CustomCreditCardWidgetState extends State<CustomCreditCardWidget> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final height = media.size.height;
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          cardBgColor: const Color(0xff1b4b3e),
          isSwipeGestureEnabled: true,
          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
        ),
        CreditCardForm(
          autovalidateMode: widget.autoValidateMode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (CreditCardModel creditCardModel) {
            setState(() {
              cardNumber = creditCardModel.cardNumber;
              expiryDate = creditCardModel.expiryDate;
              cardHolderName = creditCardModel.cardHolderName;
              cvvCode = creditCardModel.cvvCode;
              showBackView = creditCardModel.isCvvFocused;
            });
          },
          formKey: widget.formKey,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
          child: SizedBox(
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
                if (widget.formKey.currentState!.validate()) {
                  widget.formKey.currentState!.save();
                  log('valid');
                } else {
                  widget.autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: Text('Pay', style: Styles.style22),
            ),
          ),
        ),
      ],
    );
  }
}

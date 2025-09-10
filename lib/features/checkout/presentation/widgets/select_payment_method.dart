import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectPaymentMethod extends StatelessWidget {
  final int selectedIndex;
  final List<String> paymentMethods;
  final ValueChanged<int> onChanged;

  const SelectPaymentMethod({
    super.key,
    required this.selectedIndex,
    required this.paymentMethods,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(paymentMethods.length, (index) {
        bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () => onChanged(index),
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
}

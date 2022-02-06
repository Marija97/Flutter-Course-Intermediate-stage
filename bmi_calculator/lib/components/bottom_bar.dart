import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({required this.label, this.onPress});

  final void Function()? onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(child: Text(label, style: largeTextStyle)),
        color: highlightColor,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        // padding: const EdgeInsets.only(bottom: 0),
        //width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}

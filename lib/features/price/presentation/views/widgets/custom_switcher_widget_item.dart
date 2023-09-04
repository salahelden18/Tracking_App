import 'package:flutter/material.dart';

class CustomSwitcherWidgetItem extends StatelessWidget {
  const CustomSwitcherWidgetItem({
    super.key,
    required this.text,
    this.color,
    this.textColor,
  });

  final String text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}

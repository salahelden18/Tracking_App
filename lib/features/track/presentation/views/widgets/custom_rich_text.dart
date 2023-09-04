import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.text,
      required this.secondText,
      this.fontWeight});

  final String text;
  final String secondText;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$text: ',
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: secondText,
            style: TextStyle(fontWeight: fontWeight, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

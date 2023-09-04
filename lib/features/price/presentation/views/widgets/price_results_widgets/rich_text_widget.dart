import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    required this.title,
    required this.result,
  });

  final String title;
  final String result;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: const TextStyle(color: Colors.black, fontSize: 16),
        children: [
          TextSpan(
              text: result,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ],
      ),
    );
  }
}

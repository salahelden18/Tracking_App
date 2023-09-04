import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {Color? color, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Center(child: Text(text)),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.keyboardType,
    this.formatters,
  });

  final String label;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: buildBorder(Colors.grey),
        disabledBorder: buildBorder(Colors.grey),
        enabledBorder: buildBorder(Colors.grey),
        errorBorder: buildBorder(),
        focusedBorder: buildBorder(Colors.grey),
        label: Text(label),
      ),
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: formatters,
    );
  }
}

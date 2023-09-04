import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.onChange,
    this.keyboardType,
    this.formatters,
    this.readonly = false,
    this.controller,
    this.filled,
    this.focusNode,
    this.textInputAction,
  });

  final String label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final List<TextInputFormatter>? formatters;
  final bool readonly;
  final bool? filled;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      focusNode: focusNode,
      controller: controller,
      readOnly: readonly,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        filled: filled,
        border: buildBorder(Colors.grey),
        disabledBorder: buildBorder(Colors.grey),
        enabledBorder: buildBorder(Colors.grey),
        errorBorder: buildBorder(Colors.grey),
        focusedBorder: buildBorder(Colors.grey),
        label: Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      keyboardType: keyboardType,
      inputFormatters: formatters,
    );
  }
}

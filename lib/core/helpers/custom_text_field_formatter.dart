import 'package:flutter/services.dart';

class DoubleTextInputFormatter extends TextInputFormatter {
  static final RegExp _regExp = RegExp(r'^(\d*\.?\d*)?$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value is empty or matches the regex pattern, allow the update.
    if (newValue.text.isEmpty || _regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    // Otherwise, prevent the update by returning the old value.
    return oldValue;
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_border.dart';

class CustomDropDownButtonPrice extends StatelessWidget {
  const CustomDropDownButtonPrice(
      {super.key,
      required this.text,
      required this.onChange,
      this.errorMessage,
      required this.data,
      required this.value});

  final String text;
  final String? errorMessage;
  final void Function(String?)? onChange;
  final List<String> data;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(),
        border: buildBorder(Colors.grey),
        disabledBorder: buildBorder(Colors.grey),
        enabledBorder: buildBorder(Colors.grey),
        errorBorder: buildBorder(Colors.grey),
        focusedBorder: buildBorder(Colors.grey),
      ),
      hint: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      items: data
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: Theme.of(context).textTheme.bodyLarge),
            ),
          )
          .toList(),
      // validator: (value) {
      //   if (value == null) {
      //     return 'Please select $errorMessage';
      //   }
      //   return null;
      // },
      onChanged: onChange,
      value: value,
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_border.dart';
import 'package:kargomkolay_tracking_app/core/themes/colors.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.textEditingController, this.validate});

  final TextEditingController textEditingController;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validate,
      style: Theme.of(context).textTheme.bodyLarge,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: AppStrings.hintText(context),
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        enabledBorder: buildBorder(Colors.grey),
        disabledBorder: buildBorder(Colors.grey),
        focusedBorder: buildBorder(Colors.grey),
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
      ),
    );
  }
}

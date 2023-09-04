import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.onPress});

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.arabicUnSupport(context)),
      content: Text(
        AppStrings.continueInEnglish(context),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: _buildTextForAlertDialog('Cancel', Colors.red),
        ),
        TextButton(
          onPressed: onPress,
          child: _buildTextForAlertDialog('Continue', Colors.green),
        ),
      ],
    );
  }

  Text _buildTextForAlertDialog(String text, Color color) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPress,
  });

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPress,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            minimumSize: const MaterialStatePropertyAll(
              Size(double.infinity, 40),
            ),
          ),
      child: Text(AppStrings.cargoWhere(context)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/add_delete_package.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/custom_toggle_button.dart';

class ParcelContentButtonsSection extends StatelessWidget {
  const ParcelContentButtonsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Who Will Pay The tax?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        CustomToggleButton(),
        SizedBox(height: 10),
        AddDeletePackage(),
        SizedBox(height: 15),
      ],
    );
  }
}

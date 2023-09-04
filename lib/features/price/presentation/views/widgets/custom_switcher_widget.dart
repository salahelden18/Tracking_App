import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/switcher_row.dart';

class CustomSwitcherWidget extends StatelessWidget {
  const CustomSwitcherWidget({super.key, required this.weightController});
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width * 0.60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: SwitcherRow(weightController: weightController),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/custom_switcher_widget.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/searchable_drop_down.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/type_and_currency_section.dart';

class PriveViewDropDownSection extends StatelessWidget {
  const PriveViewDropDownSection({
    super.key,
    required this.weightController,
  });

  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TypeAndCurrencySection(),
        const SizedBox(height: 15),
        const SearchableDropDown(),
        const SizedBox(height: 20),
        CustomSwitcherWidget(weightController: weightController),
        const SizedBox(height: 20),
      ],
    );
  }
}

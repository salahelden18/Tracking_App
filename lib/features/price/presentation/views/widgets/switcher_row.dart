import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/custom_switcher_widget_item.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/package_cubit/package_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/switcher_cubit/switcher_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/toggle_button_cubit/toggle_button_cubit.dart';

class SwitcherRow extends StatelessWidget {
  const SwitcherRow({
    super.key,
    required this.weightController,
  });

  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    final switcherCubit = context.watch<SwitcherCubit>();
    return Row(
      children: List.generate(
        2,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              switcherCubit.toggleButton(index);
              context.read<PackageCubit>().resetPackages();
              context.read<ToggleButtonCubit>().resetState();
              weightController.text = '';
            },
            child: CustomSwitcherWidgetItem(
              text: AppStrings.listOfDocsParcel(context)[index],
              color: index == switcherCubit.state
                  ? const Color.fromARGB(255, 187, 26, 14)
                  : null,
              textColor: index == switcherCubit.state ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/toggle_button_cubit/toggle_button_cubit.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final toggleCubit = context.watch<ToggleButtonCubit>();
    final size = MediaQuery.of(context).size;
    return ToggleButtons(
      isSelected: toggleCubit.state == 1 ? [true, false] : [false, true],
      onPressed: toggleCubit.onPress,
      borderRadius: BorderRadius.circular(10),
      constraints: const BoxConstraints(maxHeight: 35, minHeight: 35),
      children: [
        SizedBox(
          width: size.width * .40,
          child: Text(
            '${AppStrings.receiver(context)} (DAP)',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: size.width * .40,
          child: Text(
            '${AppStrings.sender(context)} (DDP)',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

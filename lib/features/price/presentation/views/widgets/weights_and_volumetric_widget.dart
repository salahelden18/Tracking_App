import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/custom_text_field.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/package_cubit/package_cubit.dart';

class WeightsAndVolumetricWidget extends StatefulWidget {
  const WeightsAndVolumetricWidget({
    super.key,
  });

  @override
  State<WeightsAndVolumetricWidget> createState() =>
      _WeightsAndVolumetricWidgetState();
}

class _WeightsAndVolumetricWidgetState
    extends State<WeightsAndVolumetricWidget> {
  late final TextEditingController _weightController;
  late final TextEditingController _volumetricWeightController;

  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController();
    _volumetricWeightController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _weightController.dispose();
    _volumetricWeightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final packageCubit = context.watch<PackageCubit>();
    _weightController.text = packageCubit.getTotalWeight().toString();
    _volumetricWeightController.text =
        packageCubit.getTotalVolumetricWeight().toString();
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: _volumetricWeightController,
            filled: true,
            readonly: true,
            label: 'Volumetric Weight (KG)',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomTextField(
            controller: _weightController,
            filled: true,
            readonly: true,
            label: 'Total Weight (KG)',
          ),
        ),
      ],
    );
  }
}

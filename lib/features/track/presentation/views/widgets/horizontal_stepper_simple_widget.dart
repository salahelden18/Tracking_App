import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/data_model.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/custom_stepper.dart';

class HorizontalStepperSimpleWidget extends StatelessWidget {
  const HorizontalStepperSimpleWidget({super.key, required this.data});

  final List<DataModel> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: CustomStepper(
        controlsBuilder: (context, details) => Container(),
        currentStep: 1,
        elevation: 0,
        type: CustomStepperType.horizontal,
        steps: AppStrings.simpleStepperList(data, context)
            .map(
              (e) => StepCustom(
                state: StepStateCustom.complete,
                isActive: e.isActive,
                title: Text(
                  '${e.label} ',
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
                // label: Text(
                //   e.label,
                //   style: TextStyle(fontSize: 10),
                // ),
                content: Container(),
              ),
            )
            .toList(),
      ),
    );
  }
}

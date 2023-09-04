import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/events_model.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/custom_stepper.dart';

class SmallStepperWidget extends StatelessWidget {
  const SmallStepperWidget({super.key, required this.eventsModel});
  final EventsModel eventsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: CustomStepper(
          controlsBuilder: (context, details) => const SizedBox(),
          steps: AppStrings.stepsStepper(eventsModel)
              .map(
                (e) => StepCustom(
                  isActive: e.isActive,
                  title: Text(e.title),
                  content: Container(),
                ),
              )
              .toList()),
    );
  }
}

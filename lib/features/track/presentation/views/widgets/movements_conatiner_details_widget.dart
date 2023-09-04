import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/data_model.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/stepper_widget.dart';

class MovementsContainerDetailsWidget extends StatelessWidget {
  const MovementsContainerDetailsWidget({
    super.key,
    required this.data,
    required this.carrierCompany,
  });

  final List<DataModel> data;
  final String carrierCompany;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: StepperWidget(data: data, carrierCompany: carrierCompany),
    );
  }
}

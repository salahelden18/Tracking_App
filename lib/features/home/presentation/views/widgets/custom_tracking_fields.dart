import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/custom_field_drop_down.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/custom_text_form_field.dart';

class CustomTrackingFields extends StatelessWidget {
  const CustomTrackingFields(
      {super.key, required this.trackingController, required this.formKey});

  final GlobalKey formKey;
  final TextEditingController trackingController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomFieldDropDown(),
          const SizedBox(height: 10),
          CustomTextFormField(
            textEditingController: trackingController,
            validate: (val) {
              if (val!.isEmpty) {
                return AppStrings.emptyErrorMessage(context);
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

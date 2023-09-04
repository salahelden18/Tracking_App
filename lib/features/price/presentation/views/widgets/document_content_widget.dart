import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kargomkolay_tracking_app/core/helpers/custom_text_field_formatter.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/custom_text_form_field.dart';

class DocumentContentWidget extends StatelessWidget {
  const DocumentContentWidget({
    super.key,
    required TextEditingController documentWeightController,
  }) : _documentWeightController = documentWeightController;

  final TextEditingController _documentWeightController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: _documentWeightController,
      label: '${AppStrings.weight(context)} (KG)',
      formatters: [DoubleTextInputFormatter()],
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Weight';
        }
        return null;
      },
    );
  }
}

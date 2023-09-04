import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_border.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/drop_down_button_cubit/drop_down_button_cubit.dart';

class CustomFieldDropDown extends StatelessWidget {
  const CustomFieldDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final dropDownCubit = context.watch<DropDownButtonCubit>();

    return DropdownButtonFormField2(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(),
        border: buildBorder(Colors.grey),
        disabledBorder: buildBorder(Colors.grey),
        enabledBorder: buildBorder(Colors.grey),
        errorBorder: buildBorder(),
        focusedBorder: buildBorder(Colors.grey),
      ),
      hint: Text(
        AppStrings.dropDownButtonEmptyText(context),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      items: AppStrings.kargomKolayCarrierCompanies
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ))
          .toList(),
      validator: (val) {
        if (val == null) {
          return AppStrings.noCarrierChosen(context);
        }
        return null;
      },
      onChanged: dropDownCubit.selectCarrier,
      value: dropDownCubit.state,
    );
  }
}

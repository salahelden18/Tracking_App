import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/drop_down_button_cubit/drop_down_button_cubit.dart';

import '../../../../../core/themes/colors.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dropDownCubit = context.watch<DropDownButtonCubit>();
    return Container(
      decoration: _buildBoxDropDownButtonDecoration(),
      child: DropdownButton<String>(
        value: dropDownCubit.state,
        borderRadius: BorderRadius.circular(10),
        elevation: 6,
        focusColor: Colors.white,
        style: const TextStyle(color: Colors.black),
        underline: const SizedBox(),
        padding: const EdgeInsets.only(left: 10, right: 10),
        hint: Text(AppStrings.dropDownButtonEmptyText(context)),
        isExpanded: true,
        items: AppStrings.kargomKolayCarrierCompanies
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: dropDownCubit.selectCarrier,
      ),
    );
  }

  BoxDecoration _buildBoxDropDownButtonDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1, color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

// const [
//           DropdownMenuItem(
//             value: 'usp',
//             child: Text('usp'),
//           ),
//           DropdownMenuItem(
//             value: 'Dhl',
//             child: Text('Dhl'),
//           ),
//           DropdownMenuItem(
//             value: 'FexEx',
//             child: Text('FedEx'),
//           ),
//         ]
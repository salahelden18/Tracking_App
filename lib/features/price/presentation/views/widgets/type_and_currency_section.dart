import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/custom_drop_down_button_price.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/type_currency_cubit/type_currency_cubit.dart';

class TypeAndCurrencySection extends StatelessWidget {
  const TypeAndCurrencySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final typeCurrencyCubit = context.watch<TypeCurrencyCubit>();
    return Column(
      children: [
        CustomDropDownButtonPrice(
          text: AppStrings.tradeType(context),
          data: AppStrings.listOfTypes(context),
          value: typeCurrencyCubit.state.type == null
              ? null
              : AppStrings.importOrExport(
                  typeCurrencyCubit.state.type!, context),
          onChange: (value) {
            typeCurrencyCubit.chooseType(
              value == AppStrings.importString(context) ? 1 : 2,
            );
          },
        ),
        const SizedBox(height: 15),
        CustomDropDownButtonPrice(
          text: AppStrings.chooseCurrency(context),
          data: AppStrings.listOfCurrencies,
          value: typeCurrencyCubit.state.currency,
          onChange: (value) {
            context.read<TypeCurrencyCubit>().chooseCurrency(value);
          },
        ),
      ],
    );
  }
}

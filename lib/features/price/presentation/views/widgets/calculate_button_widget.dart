import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/core/utils/snack_bar.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/language_cubit/language_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/package_model.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/request_model.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/price_results_view.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/countries_cubit.dart/countries_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/package_cubit/package_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/price_repo/price_repo_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/price_repo/price_repo_states.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/switcher_cubit/switcher_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/toggle_button_cubit/toggle_button_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/type_currency_cubit/type_currency_cubit.dart';

class CalculateButtonWidget extends StatelessWidget {
  const CalculateButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.weightController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    final typeCurrencyCubit = context.read<TypeCurrencyCubit>();
    final countryCubit = context.read<CountriesCubit>();
    final packageCubit = context.read<PackageCubit>();
    final incotermToggle = context.read<ToggleButtonCubit>();
    final packageTypeSwitcher = context.read<SwitcherCubit>();
    return BlocConsumer<PriceRepoCubit, PriceRepoStates>(
      listener: (context, state) {
        if (state is PriceFailureState) {
          showSnackBar(context, text: state.message);
        } else if (state is PriceLoadedState) {
          // rsetting all the states
          // typeCurrencyCubit.resetState();
          // countryCubit.resetState();
          // incotermToggle.resetState();
          // packageCubit.resetPackages();
          // packageTypeSwitcher.resetState();

          // resetting the weight field
          // weightController.text = '';

          //adding navigation to the next screen
          Navigator.of(context).pushNamed(PriceResultView.routeName,
              arguments: state.priceModel);
        }
      },
      builder: (context, state) {
        return FilledButton(
          onPressed: () async {
            // only used for document weight part
            final bool isValid = _formKey.currentState!.validate();

            if (!isValid) return;

            RequestModel requestModel;

            // if type, currency and cuntry in not chosen show error
            if (!typeCurrencyCubit.isValid() || !countryCubit.isValid()) {
              showSnackBar(context,
                  text: AppStrings.requiredFieldsError(context));
              return;
            }

            if (packageTypeSwitcher.state == 0) {
              // means document
              // only the weight will be sent
              requestModel = RequestModel(
                tradeType: typeCurrencyCubit.state.type ?? 1,
                countryCode: countryCubit.state!.split('-')[1].trim(),
                currency: typeCurrencyCubit.state.currency ?? 'EUR',
                incorterm: incotermToggle.state,
                packageType: packageTypeSwitcher.state + 1,
                packageProp: [
                  PackageModel(
                    double.parse(weightController.text),
                    0,
                    0,
                    0,
                  ),
                ],
              );
            } else {
              // parcel all the dimensions should be sent
              if (!packageCubit.isValid()) {
                showSnackBar(context,
                    text: AppStrings.dimensionsError(context));
                return;
              } else {
                requestModel = RequestModel(
                  tradeType: typeCurrencyCubit.state.type ?? 1,
                  countryCode: countryCubit.state!.split('-')[1].trim(),
                  currency: typeCurrencyCubit.state.currency ?? 'EUR',
                  incorterm: incotermToggle.state,
                  packageType: packageTypeSwitcher.state + 1,
                  packageProp: packageCubit.state,
                );
              }
            }

            FocusScope.of(context).unfocus();

            await context.read<PriceRepoCubit>().getPriceResults(
                context.read<LanguageCubit>().state, requestModel);
          },
          child: Text(
            AppStrings.calculate(context),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}

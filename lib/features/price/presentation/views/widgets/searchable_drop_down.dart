import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_border.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_search_drop_down_menu.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/countries_cubit.dart/countries_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/fetch_countries_cubit/fetch_countries_cubit.dart';

class SearchableDropDown extends StatefulWidget {
  const SearchableDropDown({super.key});

  @override
  State<SearchableDropDown> createState() => _SearchableDropDownState();
}

class _SearchableDropDownState extends State<SearchableDropDown> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // chnaged from watch to read
    final countryCubit = context.watch<CountriesCubit>();
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(),
        border: buildBorder(Colors.grey),
        disabledBorder: buildBorder(Colors.grey),
        enabledBorder: buildBorder(Colors.grey),
        errorBorder: buildBorder(Colors.grey),
        focusedBorder: buildBorder(Colors.grey),
      ),
      hint: Text(
        AppStrings.chooseCountry(context),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      items: context
          .read<FetchCountriesCubit>()
          .state
          .map(
            (item) => DropdownMenuItem<String>(
              value: item.toString(),
              child: Text(item.toString(),
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
          )
          .toList(),
      onChanged: countryCubit.chooseCountry,
      value: countryCubit.state,
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      dropdownStyleData: const DropdownStyleData(
        maxHeight: 300,
      ),
      dropdownSearchData: buildDropDownSearchData(textEditingController),
      onMenuStateChange: (isOpen) {
        if (!isOpen) {
          textEditingController.clear();
        }
      },
    );
  }
}

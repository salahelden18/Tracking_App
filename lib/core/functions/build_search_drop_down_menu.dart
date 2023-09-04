import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/build_search_text_field_country.dart';

DropdownSearchData<String> buildDropDownSearchData(
    TextEditingController textEditingController) {
  return DropdownSearchData(
    searchController: textEditingController,
    searchInnerWidgetHeight: 50,
    searchInnerWidget: Container(
      height: 50,
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 4,
        right: 8,
        left: 8,
      ),
      child: BuildSearchTextFieldCountry(
          textEditingController: textEditingController),
    ),
    searchMatchFn: (item, searchValue) {
      return item.value
          .toString()
          .toLowerCase()
          .contains(searchValue.toLowerCase());
    },
  );
}

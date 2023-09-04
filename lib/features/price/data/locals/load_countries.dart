import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/countries_model.dart';

class CountryDataParser {
  Future<List<CountriesModel>> parseCountryData() async {
    try {
      final String jsonData =
          await rootBundle.loadString('assets/jsons/CountryCodes.json');

      final List<dynamic> decodedData = json.decode(jsonData);

      List<CountriesModel> countries = decodedData.map((e) {
        return CountriesModel(e['name'], e['code']);
      }).toList();

      return countries;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

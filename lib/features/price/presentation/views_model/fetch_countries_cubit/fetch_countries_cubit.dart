import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/features/price/data/locals/load_countries.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/countries_model.dart';

class FetchCountriesCubit extends Cubit<List<CountriesModel>> {
  final CountryDataParser countryDataParser;
  FetchCountriesCubit(this.countryDataParser) : super([]);

  Future getAllCountries() async {
    List<CountriesModel> countries = await countryDataParser.parseCountryData();
    emit(countries);
  }
}

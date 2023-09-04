import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesCubit extends Cubit<String?> {
  CountriesCubit() : super(null);

  void chooseCountry(String? value) {
    emit(value);
  }

  void resetState() {
    emit(null);
  }

  bool isValid() {
    return state != null;
  }
}

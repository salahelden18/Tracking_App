import 'package:bloc/bloc.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super('en');

  void changeLanguage(String language) {
    emit(language);
  }
}

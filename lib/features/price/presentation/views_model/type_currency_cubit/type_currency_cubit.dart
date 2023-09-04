import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/type_currency_cubit/type_currency_state.dart';

class TypeCurrencyCubit extends Cubit<TypeCurrecncyState> {
  TypeCurrencyCubit() : super(TypeCurrecncyState(2, 'EUR'));

  void chooseType(int? type) {
    final currentState = state;
    emit(currentState.copyWith(type: type));
  }

  void chooseCurrency(String? currency) {
    final currentState = state;
    emit(currentState.copyWith(currency: currency));
  }

  void resetState() {
    emit(TypeCurrecncyState(2, 'EUR'));
  }

  bool isValid() {
    return state.currency != null && state.type != null;
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownButtonCubit extends Cubit<String?> {
  DropDownButtonCubit() : super(null);

  void selectCarrier(String? carrier) {
    emit(carrier);
  }

  void resetState() {
    emit(null);
  }
}

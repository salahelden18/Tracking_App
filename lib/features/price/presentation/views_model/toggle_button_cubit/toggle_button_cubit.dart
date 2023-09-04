import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleButtonCubit extends Cubit<int> {
  ToggleButtonCubit() : super(1);

  void onPress(int index) {
    int currentIndex = state;
    emit(currentIndex == 1 ? 2 : 1);
  }

  void resetState() {
    emit(1);
  }
}

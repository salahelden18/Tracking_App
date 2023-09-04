import 'package:flutter_bloc/flutter_bloc.dart';

class SwitcherCubit extends Cubit<int> {
  SwitcherCubit() : super(0);

  void toggleButton(int index) {
    emit(index);
  }

  void resetState() {
    emit(0);
  }
}

import 'package:equatable/equatable.dart';

class StepperModel extends Equatable {
  final String title;
  final bool isActive;

  const StepperModel(this.title, this.isActive);

  @override
  List<Object?> get props => [title, isActive];
}

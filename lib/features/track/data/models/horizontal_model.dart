import 'package:equatable/equatable.dart';

class HorizontalModel extends Equatable {
  final String label;
  final bool isActive;

  const HorizontalModel(this.label, this.isActive);

  @override
  List<Object?> get props => [label, isActive];
}

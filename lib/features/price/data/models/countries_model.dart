import 'package:equatable/equatable.dart';

class CountriesModel extends Equatable {
  final String name;
  final String code;

  const CountriesModel(this.name, this.code);

  @override
  String toString() {
    return "$name - $code";
  }

  @override
  List<Object?> get props => [name, code];
}

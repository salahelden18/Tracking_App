// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PackageModel extends Equatable {
  final double weight;
  final double width;
  final double height;
  final double length;

  const PackageModel(this.weight, this.width, this.height, this.length);

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'height': height,
      'length': length,
      'width': width,
    };
  }

  PackageModel copyWith({
    double? weight,
    double? width,
    double? height,
    double? length,
  }) {
    return PackageModel(
      weight ?? this.weight,
      width ?? this.width,
      height ?? this.height,
      length ?? this.length,
    );
  }

  @override
  List<Object?> get props => [weight, width, height, length];
}

import 'package:equatable/equatable.dart';

class InfoModel extends Equatable {
  final String carrierCompany;
  final String trackingNumber;
  final String? description;

  const InfoModel(
      {required this.carrierCompany,
      required this.trackingNumber,
      required this.description});

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      carrierCompany: json['carrierCompany'],
      trackingNumber: json['trackingNumber'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [carrierCompany, trackingNumber, description];
}

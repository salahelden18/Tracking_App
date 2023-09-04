import 'package:equatable/equatable.dart';

class DataItem extends Equatable {
  final String firmName;
  final double price;
  final int avgShipmentDay;

  const DataItem(
      {required this.firmName,
      required this.price,
      required this.avgShipmentDay});

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      firmName: json['firmName'],
      price: double.tryParse(json['price'].toString()) ?? 00.0,
      avgShipmentDay: json['avgShipmentDay'],
    );
  }

  @override
  List<Object?> get props => [firmName, price, avgShipmentDay];
}

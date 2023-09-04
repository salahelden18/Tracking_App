import 'package:equatable/equatable.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/data_item.dart';

class PriceModel extends Equatable {
  final String status;
  final String currency;
  final DataItem lowestPrice;
  final DataItem? lowestShipmentDays;
  final List<DataItem> data;

  const PriceModel({
    required this.status,
    required this.currency,
    required this.lowestPrice,
    required this.lowestShipmentDays,
    required this.data,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> dataList = json['data'];
    List<DataItem> data = dataList.map((el) => DataItem.fromJson(el)).toList();
    return PriceModel(
      status: json['status'],
      currency: json['currency'],
      lowestPrice: DataItem.fromJson(json['lowestPrice']),
      lowestShipmentDays: json['lowestShipmentDays'] != null
          ? DataItem.fromJson(json['lowestShipmentDays'])
          : null,
      data: data,
    );
  }

  @override
  List<Object?> get props =>
      [status, currency, lowestPrice, lowestShipmentDays, data];
}

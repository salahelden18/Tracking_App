import 'package:equatable/equatable.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/package_model.dart';

class RequestModel extends Equatable {
  final int tradeType;
  final String countryCode;
  final String currency;
  final int incorterm;
  final int packageType;
  final List<PackageModel> packageProp;

  const RequestModel({
    required this.tradeType,
    required this.countryCode,
    required this.currency,
    required this.incorterm,
    required this.packageType,
    required this.packageProp,
  });

  Map<String, dynamic> toJson() {
    return {
      'tradeType': tradeType,
      'countryCode': countryCode,
      'currency': currency,
      'incorterm': incorterm,
      'packageType': packageType,
      'packageProp':
          packageProp.map((packageModel) => packageModel.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props =>
      [tradeType, countryCode, currency, incorterm, packageType, packageProp];
}

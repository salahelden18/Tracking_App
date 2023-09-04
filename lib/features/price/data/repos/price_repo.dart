import 'package:dartz/dartz.dart';
import 'package:kargomkolay_tracking_app/core/error/failure.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/Price_model.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/request_model.dart';

abstract class PriceRepo {
  Future<Either<Failure, PriceModel>> getCargoPriceResult(
      String language, RequestModel requestModel);
}

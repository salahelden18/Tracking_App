import 'package:dartz/dartz.dart';
import 'package:kargomkolay_tracking_app/core/error/failure.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/track_model.dart';

abstract class TrackRepo {
  Future<Either<Failure, TrackModel>> fetchTrackInfo(
      String carrierCompany, String trackingNumber, String language);
}

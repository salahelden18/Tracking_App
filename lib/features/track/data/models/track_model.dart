import 'package:equatable/equatable.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/events_model.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/info_model.dart';

class TrackModel extends Equatable {
  final String status;
  final InfoModel requestInfo;
  final EventsModel eventsModel;

  const TrackModel({
    required this.eventsModel,
    required this.requestInfo,
    required this.status,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      eventsModel: EventsModel.fromJson(json['events']),
      requestInfo: InfoModel.fromJson(json['requestInfo']),
      status: json['status'],
    );
  }

  @override
  List<Object?> get props => [eventsModel, requestInfo, status];
}

import 'package:equatable/equatable.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/data_model.dart';

class EventsModel extends Equatable {
  final String lastStatus;
  final List<DataModel> events;

  const EventsModel({required this.events, required this.lastStatus});

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    // make for loop for the events
    List<dynamic> eventDataList = json['data'];

    List<DataModel> events = eventDataList.map((eventData) {
      return DataModel.fromJson(eventData);
    }).toList();

    return EventsModel(
      events: events,
      lastStatus: json['lastStatus'],
    );
  }

  @override
  List<Object?> get props => [lastStatus, events];
}

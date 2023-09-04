import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  final String timestamp;
  final String status;
  final String? description;
  final bool isActive;

  const DataModel({
    required this.description,
    required this.status,
    required this.timestamp,
    this.isActive = true, // added automatically to all the fields
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      description: json['description'],
      status: json['status'],
      timestamp: json['timestamp'],
    );
  }

  @override
  List<Object?> get props => [timestamp, status, description];
}

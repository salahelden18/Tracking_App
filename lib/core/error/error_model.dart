import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String message;
  final String status;

  const ErrorModel({required this.message, required this.status});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(message: json['message'], status: json['status']);
  }

  @override
  List<Object?> get props => [message, status];
}

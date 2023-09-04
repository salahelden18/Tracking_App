part of 'track_cubit.dart';

abstract class TrackState extends Equatable {
  const TrackState();

  @override
  List<Object> get props => [];
}

class TrackInitial extends TrackState {}

class TrackLoadingState extends TrackState {}

class TrackLoadedState extends TrackState {
  final TrackModel trackModel;

  const TrackLoadedState(this.trackModel);

  @override
  List<Object> get props => [trackModel];
}

class TrackFailureState extends TrackState {
  final String message;

  const TrackFailureState(this.message);

  @override
  List<Object> get props => [message];
}

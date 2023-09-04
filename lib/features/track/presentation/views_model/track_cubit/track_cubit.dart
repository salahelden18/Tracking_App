import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kargomkolay_tracking_app/features/track/data/repos/track_repo.dart';

import '../../../data/models/track_model.dart';

part 'track_state.dart';

class TrackCubit extends Cubit<TrackState> {
  final TrackRepo trackRepo;
  TrackCubit(this.trackRepo) : super(TrackInitial());

  Future<void> fetchTrackData(
      String carrierCompany, String trackingNumber, String language) async {
    emit(TrackLoadingState());

    var result = await trackRepo.fetchTrackInfo(
        carrierCompany, trackingNumber, language);

    result.fold(
      (failure) => emit(TrackFailureState(failure.message)),
      (trackModel) => emit((TrackLoadedState(trackModel))),
    );
  }
}

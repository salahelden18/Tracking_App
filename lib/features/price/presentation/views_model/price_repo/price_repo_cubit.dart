import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/request_model.dart';
import 'package:kargomkolay_tracking_app/features/price/data/repos/price_repo.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/price_repo/price_repo_states.dart';

class PriceRepoCubit extends Cubit<PriceRepoStates> {
  PriceRepo priceRepo;
  PriceRepoCubit(this.priceRepo) : super(PriceInitial());

  Future<void> getPriceResults(
      String language, RequestModel requestModel) async {
    emit(PriceLoadingState());

    final result = await priceRepo.getCargoPriceResult(language, requestModel);
    print(result);

    result.fold(
      (failure) => emit(PriceFailureState(failure.message)),
      (result) => emit(PriceLoadedState(result)),
    );
  }
}

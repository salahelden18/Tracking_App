import 'package:equatable/equatable.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/Price_model.dart';

abstract class PriceRepoStates extends Equatable {
  const PriceRepoStates();

  @override
  List<Object> get props => [];
}

class PriceInitial extends PriceRepoStates {}

class PriceLoadingState extends PriceRepoStates {}

class PriceLoadedState extends PriceRepoStates {
  final PriceModel priceModel;

  const PriceLoadedState(this.priceModel);

  @override
  List<Object> get props => [PriceModel];
}

class PriceFailureState extends PriceRepoStates {
  final String message;

  const PriceFailureState(this.message);

  @override
  List<Object> get props => [message];
}

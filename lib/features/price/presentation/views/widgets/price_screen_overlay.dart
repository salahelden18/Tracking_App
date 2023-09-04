import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/price_repo/price_repo_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/price_repo/price_repo_states.dart';

class PriceOverlay extends StatelessWidget {
  const PriceOverlay({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final priceCubit = context.watch<PriceRepoCubit>();
    return Stack(
      children: [
        child,
        if (priceCubit.state is PriceLoadingState)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.white),
          ),
        if (priceCubit.state is PriceLoadingState)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}

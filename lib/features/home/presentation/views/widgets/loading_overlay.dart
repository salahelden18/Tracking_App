import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views_model/track_cubit/track_cubit.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final trackCubit = context.watch<TrackCubit>();
    return Stack(
      children: [
        child,
        if (trackCubit.state is TrackLoadingState)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.white),
          ),
        if (trackCubit.state is TrackLoadingState)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}

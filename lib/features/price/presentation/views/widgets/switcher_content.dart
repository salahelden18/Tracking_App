import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/document_content_widget.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/parcel_content.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/parcel_content_button_section.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/weights_and_volumetric_widget.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/switcher_cubit/switcher_cubit.dart';

class SwitcherContent extends StatelessWidget {
  const SwitcherContent({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<SwitcherCubit, int>(
      builder: (context, state) {
        if (state == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: DocumentContentWidget(
              documentWeightController: controller,
            ),
          );
        } else {
          return Column(
            children: [
              const ParcelContentButtonsSection(),
              SizedBox(
                height:
                    size.height > 534 ? size.height * 0.36 : size.height * 0.47,
                child: const ParcelContent(),
              ),
              const SizedBox(height: 7),
              const WeightsAndVolumetricWidget(),
              const SizedBox(height: 10),
            ],
          );
        }
      },
    );
  }
}

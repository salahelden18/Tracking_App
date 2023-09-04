import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_app_bar.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/track_model.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/custom_tracking_info_container.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/list_step_stepper_horizontal.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/movements_container.dart';

class TrackView extends StatelessWidget {
  static const String routeName = '/track-view';
  const TrackView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackModel = ModalRoute.of(context)?.settings.arguments as TrackModel;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // add the Horizontal Model Here (Using Custom Stepper)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListStepStepperHorizontalWidget(
                  dataModel: trackModel.eventsModel.events),
            ),
            CustomTrackingInfoContainer(
              requestInfo: trackModel.requestInfo,
              status: trackModel.eventsModel.lastStatus,
              date: trackModel.eventsModel.events[0].timestamp,
            ),
            MovementsContainerWidget(
                eventsModel: trackModel.eventsModel,
                carrierCompany: trackModel.requestInfo.carrierCompany),
          ],
        ),
      ),
    );
  }

  // AppBar _buildTrackingViewAppBar(BuildContext context) {
  //   return AppBar(
  //     title: Image.asset(
  //       AppAssets.kargomKolayLogo,
  //       height: 35,
  //     ),
  //   );
  // }
}

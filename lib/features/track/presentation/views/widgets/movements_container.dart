import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/events_model.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/movements_conatiner_details_widget.dart';

import '../../../../../core/themes/colors.dart';

class MovementsContainerWidget extends StatelessWidget {
  const MovementsContainerWidget({
    super.key,
    required this.eventsModel,
    required this.carrierCompany,
  });

  final EventsModel eventsModel;
  final String carrierCompany;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.containerColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.getMovementsTranslation(context),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          MovementsContainerDetailsWidget(
              data: eventsModel.events, carrierCompany: carrierCompany),
        ],
      ),
    );
  }
}

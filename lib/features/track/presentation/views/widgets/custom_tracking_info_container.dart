import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/language_cubit/language_cubit.dart';
import 'package:kargomkolay_tracking_app/features/track/data/models/info_model.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/widgets/custom_rich_text.dart';

import '../../../../../core/themes/colors.dart';

class CustomTrackingInfoContainer extends StatelessWidget {
  const CustomTrackingInfoContainer({
    super.key,
    required this.requestInfo,
    required this.status,
    required this.date,
  });

  final InfoModel requestInfo;
  final String status;
  final String date;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter =
        DateFormat.yMMMEd(context.read<LanguageCubit>().state);
    final String formattedTimestamp = formatter.format(DateTime.parse(date));
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRichText(
              text: AppStrings.carrierCompany(context),
              secondText: requestInfo.carrierCompany,
            ),
            const SizedBox(height: 10),
            CustomRichText(
              text: AppStrings.gettrackingNumberTranslation(context),
              secondText: requestInfo.trackingNumber,
            ),
            const SizedBox(height: 10),
            CustomRichText(
              text: AppStrings.getstatusTranslation(context),
              secondText: status,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 10),
            CustomRichText(
              text: AppStrings.getDateTranslation(context),
              secondText: formattedTimestamp,
            ),
          ],
        ),
      ),
    );
  }
}

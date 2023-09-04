import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/functions/map_firmname_to_logo.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/data_item.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/price_results_widgets/rich_text_widget.dart';

class PriceItemContentWidget extends StatelessWidget {
  const PriceItemContentWidget(
      {super.key, required this.dataModel, required this.currency});

  final DataItem dataModel;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(
          width: 1,
          color: const Color(0xffEEEEEE),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            mapFirmNameToLogo(dataModel.firmName),
            width: 110,
            height: 40,
          ),
          const SizedBox(height: 5),
          RichTextWidget(
            title: AppStrings.price(context),
            result: '${dataModel.price.toString()} $currency',
          ),
          const SizedBox(height: 5),
          if (dataModel.avgShipmentDay > 0)
            RichTextWidget(
              title: AppStrings.estimatedTime(context),
              result: '${dataModel.avgShipmentDay} ${AppStrings.days(context)}',
            ),
        ],
      ),
    );
  }
}

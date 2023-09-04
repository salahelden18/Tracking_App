import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/elevated_button_item.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/price_view.dart';

class ExtraTwoButtonWidget extends StatelessWidget {
  const ExtraTwoButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ElevatedButtonItem(
        //     text: AppStrings.takePrice(context),
        //     url: 'https://panel.kargomkolay.com/#/'),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(PriceView.routeName);
            },
            child: FittedBox(
              child: Text(
                AppStrings.takePrice(context),
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButtonItem(
          text: AppStrings.connectStore(context),
          url: 'https://panel.kargomkolay.com/#/',
          fontSize: 14,
        ),
      ],
    );
  }
}

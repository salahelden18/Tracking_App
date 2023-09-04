import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';

class HomeKargoTakipContent extends StatelessWidget {
  const HomeKargoTakipContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.yurtDisi(context),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          Text(
            AppStrings.homeKargoTakipContent(context),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

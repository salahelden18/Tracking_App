import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';

Text buidTitleText(BuildContext context) {
  return Text(
    AppStrings.yurtDisi(context),
    style: Theme.of(context).textTheme.titleMedium,
  );
}

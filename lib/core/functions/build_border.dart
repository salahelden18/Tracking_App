import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/themes/colors.dart';

OutlineInputBorder buildBorder([Color borderColor = AppColors.primaryColor]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: borderColor,
    ),
  );
}

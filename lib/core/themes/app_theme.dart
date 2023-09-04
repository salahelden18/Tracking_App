import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/helpers/custom_route.dart';
import 'package:kargomkolay_tracking_app/core/themes/colors.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto',
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: CustomPageTransitionBuilder(),
    TargetPlatform.iOS: CustomPageTransitionBuilder()
  }),
  colorSchemeSeed: AppColors.primaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    foregroundColor: AppColors.primaryColor,
    elevation: null,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  textTheme: TextTheme(
    // for the sliding text
    bodySmall: ThemeData.light().textTheme.bodySmall!.copyWith(
          color: Colors.white,
        ),
    titleMedium: ThemeData.light().textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
    titleLarge: ThemeData.light()
        .textTheme
        .titleLarge
        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
  ),
);

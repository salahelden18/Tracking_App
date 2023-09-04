import 'package:flutter/material.dart';

import '../../features/home/presentation/views/widgets/popup_menu_buttom_widget.dart';
import '../utils/app_assets.dart';

AppBar buildAppBar([bool showTrans = false, bool showElevation = true]) {
  return AppBar(
    elevation: showElevation ? 1 : null,
    surfaceTintColor: Colors.white,
    scrolledUnderElevation: showElevation ? 1 : null,
    shadowColor: Colors.black,
    title: Image.asset(
      AppAssets.kargomKolayLogo,
      height: 35,
    ),
    actions: showTrans
        ? [
            const PopupMenuButtonWidget(),
          ]
        : [],
  );
}

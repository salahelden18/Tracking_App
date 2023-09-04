import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/price_view.dart';

class ListTileWidgetInside extends StatelessWidget {
  const ListTileWidgetInside({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).pushNamed(PriceView.routeName);
      },
      leading: const Icon(FontAwesomeIcons.calculator),
      title: Text(
        AppStrings.takePrice(context),
      ),
    );
  }
}

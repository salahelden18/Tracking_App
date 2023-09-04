import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/list_tile_item.dart';

class WebsiteDrawerSection extends StatelessWidget {
  const WebsiteDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppStrings.mainDrawerItemsList(context)
          .map((e) => ListTileItem(
                text: e.name,
                url: e.url,
                icon: e.icon,
              ))
          .toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_assets.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/list_tile_widget_inside.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/send_email_drawer_widget.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/social_media_drawer_section.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/website_price_drawer_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppAssets.kargomKolayLogo,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
              const Divider(),
              const WebsiteDrawerSection(),
              const ListTileWidgetInside(),
              const Divider(),
              const SocialMediaDrawerSection(),
              const Divider(),
              const SendEmailDrawerWidget(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

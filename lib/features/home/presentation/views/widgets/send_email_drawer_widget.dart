import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/core/utils/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class SendEmailDrawerWidget extends StatelessWidget {
  const SendEmailDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.contactUs(context),
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          InkWell(
            onTap: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'info@kargomkolay.com',
              );

              if (await canLaunchUrl(emailLaunchUri)) {
                await launchUrl(emailLaunchUri);
              } else {
                if (context.mounted) {
                  showSnackBar(context, text: AppStrings.launchError(context));
                }
              }
            },
            child: const Text(
              'info@kargomkolay.com',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

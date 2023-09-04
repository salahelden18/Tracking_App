import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/core/utils/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ListTileItem extends StatefulWidget {
  const ListTileItem(
      {super.key, required this.text, this.icon, required this.url});

  final String text;
  final Icon? icon;
  final String url;

  @override
  State<ListTileItem> createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isLoading) const LinearProgressIndicator(),
        ListTile(
          onTap: () async {
            setState(() {
              isLoading = true;
            });
            final url = Uri.parse(widget.url);

            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              if (context.mounted) {
                showSnackBar(context, text: AppStrings.launchError(context));
              }
            }
            setState(() {
              isLoading = false;
            });
          },
          leading: widget.icon,
          title: Text(
            widget.text,
          ),
        ),
      ],
    );
  }
}

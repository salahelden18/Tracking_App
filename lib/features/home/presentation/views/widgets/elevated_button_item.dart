import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/core/utils/snack_bar.dart';
import 'package:kargomkolay_tracking_app/core/widgets/custom_loading.dart';
import 'package:url_launcher/url_launcher.dart';

class ElevatedButtonItem extends StatefulWidget {
  const ElevatedButtonItem(
      {super.key, required this.text, required this.url, this.fontSize});
  final String text;
  final String url;
  final double? fontSize;

  @override
  State<ElevatedButtonItem> createState() => _ElevatedButtonItemState();
}

class _ElevatedButtonItemState extends State<ElevatedButtonItem> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isLoading
          ? const CustomLoading()
          : ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                final url = Uri.parse(widget.url);

                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  if (context.mounted) {
                    showSnackBar(context,
                        text: AppStrings.launchError(context));
                  }
                }
                setState(() {
                  isLoading = false;
                });
              },
              child: Text(
                widget.text,
                style: TextStyle(fontSize: widget.fontSize),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_strings.dart';
import 'package:kargomkolay_tracking_app/core/utils/snack_bar.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/data_item.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/price_results_widgets/badge_widget.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/price_results_widgets/price_item_content_widget.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/price_results_widgets/right_arrow_part_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PriceResultItemWidget extends StatefulWidget {
  const PriceResultItemWidget({
    super.key,
    required this.dataModel,
    required this.lowestPriceCompanyName,
    required this.currency,
  });

  final DataItem dataModel;
  final String lowestPriceCompanyName;
  final String currency;

  @override
  State<PriceResultItemWidget> createState() => _PriceResultItemWidgetState();
}

class _PriceResultItemWidgetState extends State<PriceResultItemWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async {
        setState(() {
          _isLoading = true;
        });
        final url = Uri.parse('https://panel.kargomkolay.com/#/');
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            showSnackBar(context, text: AppStrings.launchError(context));
          }
        }
        setState(() {
          _isLoading = false;
        });
      },
      child: SizedBox(
        height: size.height > 534 ? size.height * 0.163 : size.height * 0.23,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: RightArrowPartWidget(isLoading: _isLoading),
            ),
            Positioned(
              left: 0,
              right: 30,
              bottom: 0,
              top: 0,
              child: PriceItemContentWidget(
                dataModel: widget.dataModel,
                currency: widget.currency,
              ),
            ),
            if (widget.lowestPriceCompanyName == widget.dataModel.firmName)
              Positioned(
                top: 0,
                left: 0,
                child: BadgeWidget(
                  text: AppStrings.lowestPrice(context),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

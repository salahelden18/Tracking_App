import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_app_bar.dart';
import 'package:kargomkolay_tracking_app/core/functions/map_currency_into_logo.dart';
import 'package:kargomkolay_tracking_app/features/price/data/models/Price_model.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/price_results_widgets/price_result_item_widget.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/price_results_widgets/validity_date_widget.dart';

class PriceResultView extends StatelessWidget {
  const PriceResultView({super.key});
  static const String routeName = '/price-results-view';

  @override
  Widget build(BuildContext context) {
    final priceModel = ModalRoute.of(context)!.settings.arguments as PriceModel;
    return Scaffold(
      appBar: buildAppBar(),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ValidityDateWidget(),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Choose Carrier',
                style: Theme.of(context).textTheme.titleLarge,
              ), // Add a space of 16.0 between items
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: PriceResultItemWidget(
                      dataModel: priceModel.data[index],
                      lowestPriceCompanyName: priceModel.lowestPrice.firmName,
                      currency: mapCurrencyIntoLogo(priceModel.currency),
                    ),
                  );
                },
                childCount: priceModel.data.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_app_bar.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/animated_changing_text.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/companies_item_logo.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/custom_drawer.dart';

import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/custom_tracking_container.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/loading_overlay.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/sliding_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/fetch_countries_cubit/fetch_countries_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // getting all the countries as far as the application start
    context.read<FetchCountriesCubit>().getAllCountries();

    return LoadingOverlay(
      child: Scaffold(
        appBar: buildAppBar(true, false),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            const SlidingText(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.20,
                      child: const CompaniesItemLogo(),
                    ),
                    const CustomTrackingContainer(),
                    if (size.height >= 534)
                      SizedBox(
                        height: size.height * 0.20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.kargomKolayFaetures,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const AnimatedChnagingText(),
                          ],
                        ),
                      ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

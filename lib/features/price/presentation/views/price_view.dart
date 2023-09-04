import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kargomkolay_tracking_app/core/functions/build_app_bar.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/calculate_button_widget.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/price_screen_overlay.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/price_view_drop_down_section.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/switcher_content.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/countries_cubit.dart/countries_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/package_cubit/package_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/switcher_cubit/switcher_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/toggle_button_cubit/toggle_button_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/type_currency_cubit/type_currency_cubit.dart';

class PriceView extends StatefulWidget {
  const PriceView({super.key});
  static const String routeName = '/price-view';

  @override
  State<PriceView> createState() => _PriceViewState();
}

class _PriceViewState extends State<PriceView> {
  late final TextEditingController _documentWeightController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _documentWeightController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _documentWeightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => CountriesCubit(),
        ),
        BlocProvider(
          create: (ctx) => SwitcherCubit(),
        ),
        BlocProvider(
          create: (ctx) => PackageCubit(),
        ),
        BlocProvider(
          create: (ctx) => ToggleButtonCubit(),
        ),
        BlocProvider(create: (ctx) => TypeCurrencyCubit()),
      ],
      child: PriceOverlay(
        child: Scaffold(
          appBar: buildAppBar(),
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                sliver: SliverToBoxAdapter(
                  child: PriveViewDropDownSection(
                    weightController: _documentWeightController,
                  ),
                ),
              ),
              // the content of document and parcel
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: Form(
                    key: _formKey,
                    child: SwitcherContent(
                      controller: _documentWeightController,
                    ),
                  ),
                ),
              ),
              // hhe button
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),
                      CalculateButtonWidget(
                          formKey: _formKey,
                          weightController: _documentWeightController),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

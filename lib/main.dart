import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:kargomkolay_tracking_app/core/services/check_internet_connection.dart';
import 'package:kargomkolay_tracking_app/core/themes/app_theme.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/home_screen.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views_model/language_cubit/language_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/data/locals/load_countries.dart';
import 'package:kargomkolay_tracking_app/features/price/data/repos/price_repo.dart';
// import 'package:kargomkolay_tracking_app/features/price/data/repos/price_repo_impl.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/price_results_view.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/price_view.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/fetch_countries_cubit/fetch_countries_cubit.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views_model/price_repo/price_repo_cubit.dart';
import 'package:kargomkolay_tracking_app/features/track/data/repos/track_repo.dart';
// import 'package:kargomkolay_tracking_app/features/track/data/repos/track_repo_impl.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views/track_view.dart';
import 'package:kargomkolay_tracking_app/features/track/presentation/views_model/track_cubit/track_cubit.dart';
import 'package:kargomkolay_tracking_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kargomkolay_tracking_app/simple_bloc_observer.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  Bloc.observer = SimpleBlocObserver();

  runApp(BlocProvider(create: (ctx) => LanguageCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => TrackCubit(di.sl<TrackRepo>()
              // TrackRepoImplementaion(
              //   CheckInternetConnection(),
              // ),
              ),
        ),
        BlocProvider(
          create: (ctx) => FetchCountriesCubit(
            di.sl<CountryDataParser>(),
          ),
        ),
        BlocProvider(
          create: (ctx) => PriceRepoCubit(
            di.sl<PriceRepo>(),
            // PriceRepoImpl(
            //   CheckInternetConnection(),
            // ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Kargo Tracking',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: Locale(context.watch<LanguageCubit>().state),
        home: const HomeScreen(),
        routes: {
          TrackView.routeName: (ctx) => const TrackView(),
          PriceView.routeName: (ctx) => const PriceView(),
          PriceResultView.routeName: (ctx) => const PriceResultView(),
        },
      ),
    );
  }
}

import 'package:get_it/get_it.dart';
import 'package:kargomkolay_tracking_app/core/services/check_internet_connection.dart';
import 'package:kargomkolay_tracking_app/features/price/data/locals/load_countries.dart';
import 'package:kargomkolay_tracking_app/features/price/data/repos/price_repo.dart';
import 'package:kargomkolay_tracking_app/features/price/data/repos/price_repo_impl.dart';
import 'package:kargomkolay_tracking_app/features/track/data/repos/track_repo.dart';
import 'package:kargomkolay_tracking_app/features/track/data/repos/track_repo_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<TrackRepo>(() => TrackRepoImplementaion(sl()));
  sl.registerLazySingleton<PriceRepo>(() => PriceRepoImpl(sl()));

  sl.registerLazySingleton<CheckInternetConnection>(
      () => CheckInternetConnection());
  sl.registerLazySingleton<CountryDataParser>(() => CountryDataParser());
}

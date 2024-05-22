import 'package:flutter_application_1/core/platform/network_info.dart';
import 'package:flutter_application_1/features/offers/data/datasources/offer_local_data_source.dart';
import 'package:flutter_application_1/features/offers/data/datasources/offer_remote_data_source.dart';
import 'package:flutter_application_1/features/offers/data/repositories/offer_repository_impl.dart';
import 'package:flutter_application_1/features/offers/domain/repositories/offer_repository.dart';
import 'package:flutter_application_1/features/offers/domain/usecases/get_all_offers.dart';
import 'package:flutter_application_1/features/offers/presentation/bloc/offer_list_cubit/offer_list_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => OfferListCubit(getAllOffers: sl()));

  sl.registerLazySingleton(
    () => GetAllOffers(sl()),
  );

  sl.registerLazySingleton<OfferRepository>(
    () => OfferRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<OfferRemoteDataSource>(
    () => OfferRemoteDataSourceImpl(
      client: http.Client(),
    ),
  );

  sl.registerLazySingleton<OfferLocalDataSource>(
    () => OfferLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

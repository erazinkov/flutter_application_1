import 'package:flutter_application_1/core/platform/network_info.dart';
import 'package:flutter_application_1/features/offers/data/datasources/offer_local_data_source.dart';
import 'package:flutter_application_1/features/offers/data/datasources/offer_remote_data_source.dart';
import 'package:flutter_application_1/features/offers/data/repositories/offer_repository_impl.dart';
import 'package:flutter_application_1/features/offers/domain/repositories/offer_repository.dart';
import 'package:flutter_application_1/features/offers/domain/usecases/get_all_offers.dart';
import 'package:flutter_application_1/features/offers/presentation/bloc/offer_list_cubit/offer_list_cubit.dart';
import 'package:flutter_application_1/features/search/data/datasources/search_local_data_source.dart';
import 'package:flutter_application_1/features/search/data/repositories/search_repository_impl.dart';
import 'package:flutter_application_1/features/search/domain/repositories/search_repository.dart';
import 'package:flutter_application_1/features/search/domain/usecases/get_search.dart';
import 'package:flutter_application_1/features/search/domain/usecases/set_search.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/features/tickets/data/datasources/tickets_local_data_source.dart';
import 'package:flutter_application_1/features/tickets/data/datasources/tickets_remote_data_source.dart';
import 'package:flutter_application_1/features/tickets/data/repositories/tickets_repository_impl.dart';
import 'package:flutter_application_1/features/tickets/domain/repositories/tickets_repository.dart';
import 'package:flutter_application_1/features/tickets/domain/usecases/get_all_tickets.dart';
import 'package:flutter_application_1/features/tickets/presentation/bloc/tickets_list_cubit/tickets_list_cubit.dart';
import 'package:flutter_application_1/features/tickets_offers/data/datasources/tickets_offer_local_data_source.dart';
import 'package:flutter_application_1/features/tickets_offers/data/datasources/tickets_offer_remote_data_source.dart';
import 'package:flutter_application_1/features/tickets_offers/data/repositories/tickets_offer_repository_impl.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/repositories/tickets_offer_repository.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/usecases/get_all_tickets_offers.dart';
import 'package:flutter_application_1/features/tickets_offers/presentation/bloc/tickets_offer_list_cubit/tickets_offer_list_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => OfferListCubit(getAllOffers: sl()));
  sl.registerFactory(() => TicketsOfferListCubit(getAllTicketsOffers: sl()));
  sl.registerFactory(() => TicketsListCubit(getAllTickets: sl()));
  sl.registerFactory(() => SearchCubit(getSearch: sl(), setSearch: sl()));

  sl.registerLazySingleton(
    () => GetAllOffers(sl()),
  );
  sl.registerLazySingleton(
    () => GetAllTicketsOffers(sl()),
  );
  sl.registerLazySingleton(
    () => GetAllTickets(sl()),
  );
  sl.registerLazySingleton(
    () => GetSearch(sl()),
  );
  sl.registerLazySingleton(
    () => SetSearch(sl()),
  );

  sl.registerLazySingleton<OfferRepository>(
    () => OfferRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<TicketsOfferRepository>(
    () => TicketsOfferRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<TicketsRepository>(
    () => TicketsRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<OfferRemoteDataSource>(
    () => OfferRemoteDataSourceImpl(
      client: http.Client(),
    ),
  );
  sl.registerLazySingleton<TicketsOfferRemoteDataSource>(
    () => TicketsOfferRemoteDataSourceImpl(
      client: http.Client(),
    ),
  );
  sl.registerLazySingleton<TicketsRemoteDataSource>(
    () => TicketsRemoteDataSourceImpl(
      client: http.Client(),
    ),
  );

  sl.registerLazySingleton<OfferLocalDataSource>(
    () => OfferLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<TicketsOfferLocalDataSource>(
    () => TicketsOfferLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<TicketsLocalDataSource>(
    () => TicketsLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<SearchLocalDataSource>(
    () => SearchLocalDataSourceImpl(
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

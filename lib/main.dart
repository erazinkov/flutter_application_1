import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/features/tickets/presentation/bloc/tickets_list_cubit/tickets_list_cubit.dart';
import 'package:flutter_application_1/features/tickets_offers/presentation/bloc/tickets_offer_list_cubit/tickets_offer_list_cubit.dart';
import 'package:flutter_application_1/features/offers/presentation/bloc/offer_list_cubit/offer_list_cubit.dart';
import 'package:flutter_application_1/locator_service.dart' as di;
import 'package:flutter_application_1/locator_service.dart';
import 'package:flutter_application_1/routing/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<OfferListCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<TicketsOfferListCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<TicketsListCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchCubit>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.black,
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: AppColors.black,
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';
import 'package:flutter_application_1/features/offers/presentation/offers_list.dart';
import 'package:flutter_application_1/routing/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';

@RoutePage()
class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsScreen> {
  late TextEditingController _fromController;
  late TextEditingController _toController;

  @override
  void initState() {
    initializeDateFormatting('ru', null);
    _fromController = TextEditingController();
    _toController = TextEditingController();
    _fromController.addListener(_fromListener);
    _toController.addListener(_toListener);
    super.initState();
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void _fromListener() {
    context
        .read<SearchCubit>()
        .onSearchChange(from: _fromController.value.text);
  }

  void _toListener() {
    context.read<SearchCubit>().onSearchChange(to: _toController.value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text(
                'Поиск дешевых \n авиабилетов',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.searchGreyDark,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.searchGrey,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          color: AppColors.searchShadow,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 4.0))
                    ],
                  ),
                  padding: const EdgeInsets.only(
                      top: 16, right: 16, bottom: 16, left: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        colorFilter: const ColorFilter.mode(
                            AppColors.black, BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state.search.from.isNotEmpty) {
                            _fromController.value =
                                TextEditingValue(text: state.search.from);
                          } else {
                            _fromController.clear();
                          }
                          if (state.search.to.isNotEmpty) {
                            _toController.value =
                                TextEditingValue(text: state.search.to);
                          } else {
                            _toController.clear();
                          }

                          return Flexible(
                            child: Column(
                              children: [
                                MyTextField(
                                  readOnly: false,
                                  showClear: true,
                                  labelText: 'Откуда - Минск',
                                  controller: _fromController,
                                ),
                                const Divider(
                                  height: 16,
                                  thickness: 1,
                                  color: AppColors.searchDivider,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.router.push(const SearchRoute());
                                  },
                                  child: MyTextField(
                                    enabled: false,
                                    readOnly: true,
                                    showClear: false,
                                    labelText: 'Куда - Турция',
                                    controller: _toController,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Музыкально отлететь',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Flexible(
                child: OffersList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

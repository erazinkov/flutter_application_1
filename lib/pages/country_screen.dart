import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_application_1/features/tickets_offers/presentation/tickets_offers_list.dart';
import 'package:flutter_application_1/pages/widgets/info_row.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late TextEditingController _fromController;

  late TextEditingController _toController;

  @override
  void initState() {
    _fromController = TextEditingController();
    _toController = TextEditingController();
    // _fromController.addListener(_fromListener);
    // _toController.addListener(_toListener);

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
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            _fromController.value = TextEditingValue(text: state.search.from);
            _toController.value = TextEditingValue(text: state.search.to);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.searchGreyDark,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.router.maybePop();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              MyTextField(
                                enabled: false,
                                controller: _fromController,
                                labelText: 'Откуда - Минск',
                                readOnly: true,
                                showClear: false,
                                onSwitch: () {
                                  _fromController.value =
                                      TextEditingValue(text: state.search.to);
                                  _toController.value =
                                      TextEditingValue(text: state.search.from);
                                },
                              ),
                              const Divider(
                                height: 16,
                                thickness: 1,
                                color: AppColors.searchDivider,
                              ),
                              MyTextField(
                                enabled: false,
                                readOnly: true,
                                showClear: true,
                                controller: _toController,
                                labelText: 'Куда - Турция',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: InfoRow(),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.searchGreyDark,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                      bottom: 6,
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Прямые рейсы',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const TicketsOffersList(),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () => {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            width: double.infinity,
                            child: const Text(
                              'Показать все',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        'Посмотреть все билеты',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_application_1/features/tickets_offers/presentation/tickets_offers_list.dart';
import 'package:flutter_application_1/pages/widgets/info_row.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountrySetPage extends StatelessWidget {
  const CountrySetPage({super.key, required this.blocContext});

  final BuildContext blocContext;

  static MaterialPageRoute<void> route({
    required BuildContext context,
  }) =>
      MaterialPageRoute(
        // fullscreenDialog: true,
        builder: (_) => CountrySetPage(
          blocContext: context,
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: BlocProvider.of<SearchCubit>(blocContext),
        child: _CountrySetPage(),
      );
}

class _CountrySetPage extends StatefulWidget {
  const _CountrySetPage({super.key});

  @override
  State<_CountrySetPage> createState() => _CountrySetPageState();
}

class _CountrySetPageState extends State<_CountrySetPage> {
  late TextEditingController _fromController;
  late TextEditingController _toController;

  @override
  void initState() {
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
      appBar: AppBar(),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state.search.from.isNotEmpty) {
            _fromController.value = TextEditingValue(text: state.search.from);
          }
          if (state.search.to.isNotEmpty) {
            _toController.value = TextEditingValue(text: state.search.to);
          }
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
                          print('123');
                          Navigator.of(context, rootNavigator: true).pop;
                        },
                        child: Icon(
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
                              controller: _fromController,
                              labelText: 'Откуда - Минск',
                              readOnly: true,
                              showClear: false,
                              onSwitch: () {
                                // context.read<SearchCubit>().onSearchSwitch();
                              },
                            ),
                            const Divider(
                              height: 16,
                              thickness: 1,
                              color: AppColors.searchDivider,
                            ),
                            MyTextField(
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
    );
  }
}

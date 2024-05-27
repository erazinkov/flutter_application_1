import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';
import 'package:flutter_application_1/pages/widgets/prompt_row.dart';
import 'package:flutter_application_1/pages/widgets/recommendations_row.dart';
import 'package:flutter_application_1/routing/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      body: SafeArea(
        child:
            BlocConsumer<SearchCubit, SearchState>(listener: (context, state) {
          if (state.search.from.isNotEmpty && state.search.to.isNotEmpty) {
            context.router.push(const CountryRoute());
          }
          if (state.search.from.isEmpty) {
            context.router.maybePop();
          }
        }, builder: (context, state) {
          if (state.search.from.isNotEmpty) {
            _fromController.value = TextEditingValue(text: state.search.from);
          } else {
            _fromController.clear();
          }
          if (state.search.to.isNotEmpty) {
            _toController.value = TextEditingValue(text: state.search.to);
          } else {
            _toController.clear();
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
                  child: Column(
                    children: [
                      MyTextField(
                        readOnly: false,
                        controller: _fromController,
                        labelText: 'Откуда - Минск',
                        assetName: 'assets/icons/plane_from.svg',
                        showClear: true,
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
                        assetName: 'assets/icons/search.svg',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const PromptRow(),
                const SizedBox(
                  height: 30,
                ),
                const RecommendationsRow(),
              ],
            ),
          );
        }),
      ),
    );
  }
}

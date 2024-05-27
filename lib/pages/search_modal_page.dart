import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_application_1/pages/country_set_page.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';
import 'package:flutter_application_1/pages/widgets/prompt_row.dart';
import 'package:flutter_application_1/pages/widgets/recommendations_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchModalPage extends StatelessWidget {
  const SearchModalPage({super.key, required this.blocContext});

  final BuildContext blocContext;

  static MaterialPageRoute<void> route({
    required BuildContext context,
  }) =>
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => SearchModalPage(
          blocContext: context,
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: BlocProvider.of<SearchCubit>(blocContext),
        child: _SearchModalPage(),
      );
}

class _SearchModalPage extends StatefulWidget {
  const _SearchModalPage({super.key});

  @override
  State<_SearchModalPage> createState() => _SearchModalPageState();
}

class _SearchModalPageState extends State<_SearchModalPage> {
  void _showFullScreenDialog(BuildContext context) {
    Navigator.of(context).push(
      CountrySetPage.route(
        context: context,
        // onClose: () {
        //   context.read<MeetListCubit>().refreshMeets();
        //   Navigator.of(context).pop();
        // },
      ),
    );
  }

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
    return BlocConsumer<SearchCubit, SearchState>(listener: (context, state) {
      if (state.search.from.isNotEmpty && state.search.to.isNotEmpty) {
        _showFullScreenDialog(context);
      }
    }, builder: (context, state) {
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
              child: Column(
                children: [
                  MyTextField(
                    controller: _fromController,
                    labelText: 'Откуда - Минск',
                    assetName: 'assets/icons/plane_from.svg',
                    onClear: () {
                      context.read<SearchCubit>().onSearchChange(from: '');
                    },
                  ),
                  const Divider(
                    height: 16,
                    thickness: 1,
                    color: AppColors.searchDivider,
                  ),
                  MyTextField(
                    controller: _toController,
                    labelText: 'Куда - Турция',
                    assetName: 'assets/icons/search.svg',
                    onClear: () {
                      context.read<SearchCubit>().onSearchChange(to: '');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            PromptRow(),
            const SizedBox(
              height: 30,
            ),
            RecommendationsRow(),
          ],
        ),
      );
    });
  }
}

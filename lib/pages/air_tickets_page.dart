import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';
import 'package:flutter_application_1/pages/widgets/search_modal.dart';
import 'package:flutter_application_1/features/offers/presentation/offers_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AirTicketsPage extends StatefulWidget {
  const AirTicketsPage({super.key});

  @override
  State<AirTicketsPage> createState() => _AirTicketsPageState();
}

class _AirTicketsPageState extends State<AirTicketsPage> {
  Future<void> _showModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.searchModalBg,
      showDragHandle: true,
      useSafeArea: true,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      context: context,
      builder: (_) => SearchModal(
        blocContext: context,
      ),
    );
  }

  late TextEditingController _fromController;

  @override
  void initState() {
    _fromController = TextEditingController();
    _fromController.addListener(_fromListener);
    super.initState();
  }

  @override
  void dispose() {
    _fromController.dispose();
    super.dispose();
  }

  void _fromListener() {
    context
        .read<SearchCubit>()
        .onSearchChange(from: _fromController.value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            context.read<SearchCubit>().state.search.from,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          // const Text(
          //   'Looking for chip \n air tickets',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     color: AppColors.white,
          //     fontWeight: FontWeight.w600,
          //     fontSize: 22,
          //   ),
          // ),
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
                  Flexible(
                    child: Column(
                      children: [
                        MyTextField(
                          labelText:
                              context.read<SearchCubit>().state.search.from,
                          onChanged: (value) => {},
                          controller: _fromController,
                        ),
                        const Divider(
                          height: 16,
                          thickness: 1,
                          color: AppColors.searchDivider,
                        ),
                        GestureDetector(
                          onTap: () => _showModalBottomSheet(context),
                          child: MyTextField(
                            labelText:
                                context.read<SearchCubit>().state.search.to,
                            enabled: false,
                            onChanged: (value) => {},
                            controller: _fromController,
                          ),
                        ),
                      ],
                    ),
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
              'Music',
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
    );
  }
}

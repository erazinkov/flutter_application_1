import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/offers/presentation/offers_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AirTicketsPage extends StatelessWidget {
  const AirTicketsPage({super.key});

  Future<void> _showModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.searchModalBg,
      showDragHandle: true,
      useSafeArea: true,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      context: context,
      builder: (context) => _SearchModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text(
            'Looking for chip \n air tickets',
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
                  Flexible(
                    child: Column(
                      children: [
                        _MyTextField(),
                        const Divider(
                          height: 16,
                          thickness: 1,
                          color: AppColors.searchDivider,
                        ),
                        GestureDetector(
                          onTap: () => _showModalBottomSheet(context),
                          child: const _MyTextField(
                            enabled: false,
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

class _SearchModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                _MyTextField(),
                const Divider(
                  height: 16,
                  thickness: 1,
                  color: AppColors.searchDivider,
                ),
                const _MyTextField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyTextField extends StatelessWidget {
  const _MyTextField({this.enabled = true, super.key});

  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      cursorColor: AppColors.searchCursor,
      obscureText: false,
      style: const TextStyle(
        color: AppColors.searchText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      keyboardType: TextInputType.text,
      onChanged: (value) {},
      autocorrect: false,
      decoration: const InputDecoration(
        isCollapsed: true,
        border: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: '123',
        labelStyle: TextStyle(
          color: AppColors.searchLabel,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

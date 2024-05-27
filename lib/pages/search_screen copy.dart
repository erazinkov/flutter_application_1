// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/common/app_colors.dart';
// import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
// import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
// import 'package:flutter_application_1/pages/country_set_page.dart';
// import 'package:flutter_application_1/pages/widgets/my_text_field.dart';
// import 'package:flutter_application_1/pages/widgets/prompt_row.dart';
// import 'package:flutter_application_1/pages/widgets/recommendations_row.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// @RoutePage()
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key, required this.blocContext});

//   final BuildContext blocContext;

//   static MaterialPageRoute<void> route({
//     required BuildContext context,
//   }) =>
//       MaterialPageRoute(
//         fullscreenDialog: true,
//         builder: (_) => SearchScreen(
//           blocContext: context,
//         ),
//       );

//   @override
//   Widget build(BuildContext context) => BlocProvider.value(
//         value: BlocProvider.of<SearchCubit>(blocContext),
//         child: _SearchScreen(),
//       );
// }

// class _SearchScreen extends StatefulWidget {
//   const _SearchScreen({super.key});

//   @override
//   State<_SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<_SearchScreen> {
//   void _showFullScreenDialog(BuildContext context) {
//     Navigator.of(context, rootNavigator: true).push(
//       CountrySetPage.route(
//         context: context,
//         // onClose: () {
//         //   context.read<MeetListCubit>().refreshMeets();
//         //   Navigator.of(context).pop();
//         // },
//       ),
//     );
//   }

//   late TextEditingController _fromController;
//   late TextEditingController _toController;

//   @override
//   void initState() {
//     _fromController = TextEditingController();
//     _toController = TextEditingController();
//     _fromController.addListener(_fromListener);
//     _toController.addListener(_toListener);

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _fromController.dispose();
//     _toController.dispose();
//     super.dispose();
//   }

//   void _fromListener() {
//     context
//         .read<SearchCubit>()
//         .onSearchChange(from: _fromController.value.text);
//   }

//   void _toListener() {
//     context.read<SearchCubit>().onSearchChange(to: _toController.value.text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<SearchCubit, SearchState>(listener: (context, state) {
//         if (state.search.to.isNotEmpty) {
//           _showFullScreenDialog(context);
//         }
//       }, builder: (context, state) {
//         if (state.search.from.isNotEmpty) {
//           _fromController.value = TextEditingValue(text: state.search.from);
//         }
//         if (state.search.to.isNotEmpty) {
//           _toController.value = TextEditingValue(text: state.search.to);
//         }
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.searchGreyDark,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     MyTextField(
//                       readOnly: false,
//                       controller: _fromController,
//                       labelText: 'Откуда - Минск',
//                       assetName: 'assets/icons/plane_from.svg',
//                       showClear: true,
//                     ),
//                     const Divider(
//                       height: 16,
//                       thickness: 1,
//                       color: AppColors.searchDivider,
//                     ),
//                     MyTextField(
//                       readOnly: true,
//                       showClear: true,
//                       controller: _toController,
//                       labelText: 'Куда - Турция',
//                       assetName: 'assets/icons/search.svg',
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               PromptRow(),
//               const SizedBox(
//                 height: 30,
//               ),
//               RecommendationsRow(),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/common/app_colors.dart';
// import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
// import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
// import 'package:flutter_application_1/pages/widgets/my_text_field.dart';
// import 'package:flutter_application_1/pages/widgets/prompt_row.dart';
// import 'package:flutter_application_1/pages/widgets/recommendations_row.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SearchModal extends StatelessWidget {
//   const SearchModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SearchCubit, SearchState>(
//       builder: (context, state) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.searchGreyDark,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   MyTextField(
//                     labelText: state.search.from,
//                     assetName: 'assets/icons/plane.svg',
//                     onChanged: (value) => {},
//                   ),
//                   Divider(
//                     height: 16,
//                     thickness: 1,
//                     color: AppColors.searchDivider,
//                   ),
//                   MyTextField(
//                     labelText: state.search.to,
//                     assetName: 'assets/icons/search.svg',
//                     onChanged: (value) => {
//                       context.read<SearchCubit>().onSearchChange(to: value),
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             PromptRow(),
//             const SizedBox(
//               height: 30,
//             ),
//             RecommendationsRow(),
//           ],
//         ),
//       ),
//     );
//   }
// }

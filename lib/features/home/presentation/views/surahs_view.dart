import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/views/quran_view.dart';
import 'package:ana_muslim/features/home/presentation/widgets/all_surahs_shimmer.dart';
import 'package:ana_muslim/features/home/presentation/widgets/surah_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/functions.dart';
import '../widgets/custom_app_bar.dart';

class SurahsView extends StatelessWidget {
  const SurahsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          top: 26.h,
        ),
        child: Column(
          children: [
            const CustomAppBar(),
            const VerticalSpacer(height: 24),
            BlocBuilder<HomeCubitCubit, HomeCubitState>(
              buildWhen: (previous, current) =>
                  current is FetchingSurahsState ||
                  current is FetchingSurahSuccesssState ||
                  current is FetchingSurahErrorState,
              builder: (context, state) {
                if (state is FetchingSurahSuccesssState) {
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      itemCount:
                          context.read<HomeCubitCubit>().allSurahs.length,
                      separatorBuilder: (context, index) => Divider(
                        endIndent: 8.w,
                        indent: 8.w,
                        height: 18.h,
                        color: AppColors.primaryBlueDarker,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuranView(
                                page: goToSpacificSurahDependOnItsOrder(index),
                              ),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(8.r),
                        highlightColor: AppColors.white,
                        hoverColor:
                            AppColors.homeScaffoldContainer.withOpacity(0.2),
                        child: SurahItem(index: index),
                      ),
                    ),
                  );
                }
                return const Expanded(
                  child: AllSurahsShimmer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

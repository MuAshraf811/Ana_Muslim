import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/hadith_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/quran_view_appbar.dart';

class SallehZekrView extends StatelessWidget {
  const SallehZekrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 24),
              const QuranAppBar(
                text:
                    "إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَوْقُوتًا",
              ),
              const VerticalSpacer(height: 18),
              BlocBuilder<HomeCubitCubit, HomeCubitState>(
                buildWhen: (previous, current) =>
                    current is LoadingListCollapsedState ||
                    current is ListCollapsedState,
                builder: (context, state) {
                  if (state is ListCollapsedState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount:
                            context.read<HomeCubitCubit>().salahZekr.length,
                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          margin: EdgeInsets.only(bottom: 16.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greyText),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Text(
                                  context
                                      .read<HomeCubitCubit>()
                                      .salahZekr[index]
                                      .zekr,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Divider(
                                  indent: 16.w,
                                  endIndent: 16.w,
                                  height: 32.h,
                                  color: AppColors.offRed,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      context
                                          .read<HomeCubitCubit>()
                                          .salahZekr[index]
                                          .repeat
                                          .toString(),
                                      style: const TextStyle(
                                          color: AppColors.primaryBlueDarker,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const HorizontalSpacer(width: 16),
                                    const Text(
                                      " التكرار",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: AppColors.blackText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                context
                                            .read<HomeCubitCubit>()
                                            .salahZekr[index]
                                            .bless
                                            .length >
                                        4
                                    ? Divider(
                                        indent: 16.w,
                                        endIndent: 16.w,
                                        height: 24.h,
                                        color: AppColors.greyText,
                                      )
                                    : const SizedBox.shrink(),
                                Text(
                                  context
                                      .read<HomeCubitCubit>()
                                      .salahZekr[index]
                                      .bless,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return const Expanded(
                    child: CustomHadithShimmer(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/hadith_shimmer.dart';
import 'package:ana_muslim/features/home/presentation/widgets/quran_view_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class AsmaaAllahView extends StatelessWidget {
  const AsmaaAllahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 20),
              const QuranAppBar(
                text: "لله تسعة وتسعين اسمًا،من أحصاها دخل الجنة",
                borederClor: AppColors.primaryBlueDarker,
              ),
              const VerticalSpacer(height: 24),
              BlocBuilder<HomeCubitCubit, HomeCubitState>(
                buildWhen: (previous, current) =>
                    current is AsmaaAllahLoadingState ||
                    current is AsmaaAllahLoadedState,
                builder: (context, state) {
                  if (state is AsmaaAllahLoadedState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount:
                            context.read<HomeCubitCubit>().asmaaAllah.length,
                        itemBuilder: (context, index) => Container(
                          width: 200.w,
                          margin: EdgeInsets.only(bottom: 12.h),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4.r),
                            border:
                                Border.all(color: AppColors.primaryBlueDarker),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 28.w,
                                  height: 20.h,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryBlueDarker,
                                  ),
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacer(height: 4),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  context
                                      .read<HomeCubitCubit>()
                                      .asmaaAllah[index]
                                      .ttl,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Divider(
                                indent: 28.w,
                                endIndent: 28.w,
                                color: AppColors.primaryBlueDarker,
                                height: 24.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  context
                                      .read<HomeCubitCubit>()
                                      .asmaaAllah[index]
                                      .dsc,
                                  style: const TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const VerticalSpacer(height: 12),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const Expanded(
                    child: CustomHadithShimmer(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

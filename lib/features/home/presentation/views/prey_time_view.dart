import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/quran_view_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PreyTimeView extends StatelessWidget {
  const PreyTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 18),
              const QuranAppBar(
                text:
                    "إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَوْقُوتًا",
              ),
              const VerticalSpacer(height: 22),
              BlocBuilder<HomeCubitCubit, HomeCubitState>(
                buildWhen: (previous, current) =>
                    current is FetchingPreyTimeState ||
                    current is FetchingPreyTimeErrorState ||
                    current is FetchingPreyTimeSuccessState,
                builder: (context, state) {
                  if (state is FetchingPreyTimeSuccessState) {
                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            context.read<HomeCubitCubit>().preyTimes.weekDay,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackText,
                            ),
                          ),
                          const VerticalSpacer(height: 16),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    color: AppColors.primaryBlueDarker)),
                            child: RowTexts(
                                icon: "",
                                keyText: 'التاريخ الميلادي',
                                valueText: context
                                    .read<HomeCubitCubit>()
                                    .preyTimes
                                    .date),
                          ),
                          const VerticalSpacer(height: 6),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    color: AppColors.primaryBlueDarker)),
                            child: RowTexts(
                                icon: "",
                                keyText: 'التاريخ الهجري',
                                valueText: context
                                    .read<HomeCubitCubit>()
                                    .preyTimes
                                    .hijiriDate),
                          ),
                          const VerticalSpacer(height: 16),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 16.h),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.offRed),
                                  borderRadius: BorderRadius.circular(6.r)),
                              child: IntrinsicHeight(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RowTexts(
                                        icon: "assets/svgs/moon.svg",
                                        keyText: "الفجر",
                                        valueText: context
                                            .read<HomeCubitCubit>()
                                            .preyTimes
                                            .fajr),
                                    Divider(
                                        color: AppColors.offRed, height: 26.h),
                                    RowTexts(
                                        icon: "assets/svgs/sunrise.svg",
                                        keyText: "الشروق",
                                        valueText: context
                                            .read<HomeCubitCubit>()
                                            .preyTimes
                                            .sunRise),
                                    Divider(
                                        color: AppColors.offRed, height: 26.h),
                                    RowTexts(
                                        icon: "assets/svgs/sun.svg",
                                        keyText: "الظهر",
                                        valueText: context
                                            .read<HomeCubitCubit>()
                                            .preyTimes
                                            .dhuhr),
                                    Divider(
                                        color: AppColors.offRed, height: 26.h),
                                    RowTexts(
                                        icon: "assets/svgs/sunrise.svg",
                                        keyText: "العصر",
                                        valueText: context
                                            .read<HomeCubitCubit>()
                                            .preyTimes
                                            .asr),
                                    Divider(
                                        color: AppColors.offRed, height: 26.h),
                                    RowTexts(
                                        icon: "assets/svgs/sunset.svg",
                                        keyText: "الغروب",
                                        valueText: context
                                            .read<HomeCubitCubit>()
                                            .preyTimes
                                            .sunSet),
                                    Divider(
                                        color: AppColors.offRed, height: 26.h),
                                    RowTexts(
                                        icon: "assets/svgs/sunset-.svg",
                                        keyText: "المغرب",
                                        valueText: context
                                            .read<HomeCubitCubit>()
                                            .preyTimes
                                            .maghrib),
                                    Divider(
                                        color: AppColors.offRed, height: 26.h),
                                    RowTexts(
                                        icon: "assets/svgs/moon.svg",
                                        keyText: "العشاء",
                                        valueText: context
                                            .read<HomeCubitCubit>()
                                            .preyTimes
                                            .isha),
                                    Divider(
                                        color: AppColors.offRed, height: 26.h),
                                    RowTexts(
                                        icon: 'assets/svgs/moon.svg',
                                        keyText: "الثلث الأخير",
                                        valueText: context
                                            .read<HomeCubitCubit>()
                                            .preyTimes
                                            .lastThird),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    );
                  }
                  return const Expanded(child: PreyShimmer());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreyShimmer extends StatelessWidget {
  const PreyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 24.h,
            width: 64.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Colors.grey.shade300,
            ),
          ),
          const VerticalSpacer(height: 12),
          Container(
            height: 36.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Colors.grey.shade300,
            ),
          ),
          const VerticalSpacer(height: 12),
          Container(
            height: 36.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Colors.grey.shade300,
            ),
          ),
          const VerticalSpacer(height: 12),
          Container(
            height: 300.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}

class RowTexts extends StatelessWidget {
  const RowTexts(
      {super.key,
      required this.keyText,
      required this.valueText,
      required this.icon});
  final String keyText;
  final String valueText;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            valueText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(flex: 5),
          Text(
            keyText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(flex: 1),
          SvgHandler(imagePath: icon, height: 24, width: 24),
        ],
      ),
    );
  }
}

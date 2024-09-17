import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/hadith_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NawawyView extends StatelessWidget {
  const NawawyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18.w,
                        color: AppColors.secondry,
                      )),
                ),
              ),
              const VerticalSpacer(height: 16),
              BlocBuilder<HomeCubitCubit, HomeCubitState>(
                buildWhen: (previous, current) =>
                    current is NawawyLoadedState ||
                    current is NawawyLoadingState,
                builder: (context, state) {
                  debugPrint(state.toString());
                  if (state is NawawyLoadedState) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: AppColors.black,
                          height: 28.h,
                          thickness: 1.5.h,
                        ),
                        itemCount: context.read<HomeCubitCubit>().nawawy.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 12.h),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: AppColors.white),
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Text(
                                  context
                                      .read<HomeCubitCubit>()
                                      .nawawy[index]
                                      .id_ar,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const VerticalSpacer(height: 10),
                                Text(
                                  context
                                      .read<HomeCubitCubit>()
                                      .nawawy[index]
                                      .topic,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const VerticalSpacer(height: 6),
                                Text(
                                  "( ${context.read<HomeCubitCubit>().nawawy[index].rawi} )",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.secondry,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const VerticalSpacer(height: 14),
                                Image.asset(
                                  'assets/images/Frame 48.png',
                                  color: AppColors.primary,
                                ),
                                const VerticalSpacer(height: 6),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      context
                                          .read<HomeCubitCubit>()
                                          .nawawy[index]
                                          .text,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                const VerticalSpacer(height: 6),
                                Image.asset(
                                  'assets/images/Frame 48.png',
                                  color: AppColors.primary,
                                ),
                                const VerticalSpacer(height: 6),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      context
                                          .read<HomeCubitCubit>()
                                          .nawawy[index]
                                          .description,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.clip,
                                      maxLines: 24,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return const Expanded(child: CustomHadithShimmer());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

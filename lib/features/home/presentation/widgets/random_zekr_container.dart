import 'package:ana_muslim/core/widgets/snack_bar.dart';
import 'package:ana_muslim/features/qiblah/presentation/cubit/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/widgets/svg_handler.dart';
import '../controllers/cubit/home_cubit_cubit.dart';

class RandomZekrContainer extends StatelessWidget {
  const RandomZekrContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: context.read<ThemeCubit>().state == 0
            ? AppColors.white
            : AppColors.primary,
        border: Border.all(
          color: context.read<ThemeCubit>().state == 0
              ? AppColors.primary
              : AppColors.white,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    context.read<HomeCubitCubit>().shareText();
                  },
                  child: BlocListener<HomeCubitCubit, HomeCubitState>(
                    listenWhen: (previous, current) =>
                        current is ShareRandomZekrState ||
                        current is ShareRandomZekrSuccessState,
                    listener: (context, state) {
                      if (state is ShareRandomZekrState) {
                        showCustomSnackBar(
                            context, 'Wait a second', AppColors.secondry);
                      }
                    },
                    child: const SvgHandler(
                      imagePath: 'assets/svgs/share 1.svg',
                      height: 20,
                      width: 24,
                    ),
                  )),
              const HorizontalSpacer(width: 24),
              InkWell(
                onTap: () {
                  context.read<HomeCubitCubit>().copyText(context);
                },
                child: SvgHandler(
                  imagePath: 'assets/svgs/order-nav.svg',
                  height: 20,
                  width: 24,
                  color: context.read<ThemeCubit>().state == 0
                      ? AppColors.primary
                      : AppColors.white,
                ),
              ),
              const Spacer(),
              Text(
                ' من الأذكار المنسية',
                style: TextStyle(
                  fontSize: 16,
                  color: context.read<ThemeCubit>().state == 0
                      ? AppColors.primary
                      : AppColors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const VerticalSpacer(height: 12),
          Divider(
            color: context.read<ThemeCubit>().state == 0
                ? AppColors.primary
                : AppColors.white,
            endIndent: 16.w,
            indent: 16.w,
          ),
          const VerticalSpacer(height: 6),
          BlocBuilder<HomeCubitCubit, HomeCubitState>(
            buildWhen: (previous, current) =>
                current is RandomZekrState ||
                current is RandomZekrSuccessState ||
                current is RandomZekrErrorState,
            builder: (context, state) {
              if (state is RandomZekrSuccessState) {
                return IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        context.read<HomeCubitCubit>().someZekrCategoryName!,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 16,
                          color: context.read<ThemeCubit>().state == 0
                              ? AppColors.primary
                              : AppColors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const VerticalSpacer(height: 8),
                      Text(
                        context.read<HomeCubitCubit>().randomZekeText,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: context.read<ThemeCubit>().state == 0
                              ? AppColors.black
                              : AppColors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 32.h,
                  width: 75.w,
                  margin: EdgeInsets.all(2.w),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

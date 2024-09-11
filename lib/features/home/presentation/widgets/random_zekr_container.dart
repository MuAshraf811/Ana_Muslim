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
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.primaryBlueDarker),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {},
                  child: const SvgHandler(
                    imagePath: 'assets/svgs/share 1.svg',
                    height: 20,
                    width: 24,
                  )),
              const HorizontalSpacer(width: 24),
              InkWell(
                onTap: () {
                  context.read<HomeCubitCubit>().copyText(context);
                },
                child: const SvgHandler(
                  imagePath: 'assets/svgs/order-nav.svg',
                  height: 20,
                  width: 24,
                  color: AppColors.offRed,
                ),
              ),
              const Spacer(),
              const Text(
                ' من الأذكار المنسية',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const VerticalSpacer(height: 12),
          Divider(
            color: AppColors.offRed,
            endIndent: 16.w,
            indent: 16.w,
          ),
          const VerticalSpacer(height: 12),
          BlocBuilder<HomeCubitCubit, HomeCubitState>(
            buildWhen: (previous, current) =>
                current is RandomZekrState ||
                current is RandomZekrSuccessState ||
                current is RandomZekrErrorState,
            builder: (context, state) {
              if (state is RandomZekrSuccessState) {
                return Text(
                  context.read<HomeCubitCubit>().randomZekeText,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                    letterSpacing: 1.5,
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

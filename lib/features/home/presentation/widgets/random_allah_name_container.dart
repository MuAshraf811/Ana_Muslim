import 'package:ana_muslim/core/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/widgets/svg_handler.dart';
import '../controllers/cubit/home_cubit_cubit.dart';

class RandomAllahNameContainer extends StatelessWidget {
  const RandomAllahNameContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.primary),
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
                child: const SvgHandler(
                  imagePath: 'assets/svgs/order-nav.svg',
                  height: 20,
                  width: 24,
                  color: AppColors.secondry,
                ),
              ),
              const Spacer(),
              const Row(
                children: [
                  Text(
                    ' من أسماء الله',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.greyText,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const VerticalSpacer(height: 12),
          Divider(
            color: AppColors.greyText,
            endIndent: 16.w,
            indent: 16.w,
          ),
          const VerticalSpacer(height: 6),
          BlocBuilder<HomeCubitCubit, HomeCubitState>(
            buildWhen: (previous, current) =>
                current is RandomAsmState ||
                current is RandomAsmSuccessState ||
                current is RandomAsmErrorState,
            builder: (context, state) {
              if (state is RandomAsmSuccessState) {
                return Column(
                  children: [
                    Text(
                      context.read<HomeCubitCubit>().someName!.ttl,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const VerticalSpacer(height: 4),
                    Text(
                      context.read<HomeCubitCubit>().someName!.dsc,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.black,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
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

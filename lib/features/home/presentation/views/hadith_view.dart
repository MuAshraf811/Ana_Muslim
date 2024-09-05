import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/utils/functions.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 20),
              const CustomAppBar(),
              const VerticalSpacer(height: 24),
              BlocBuilder<HomeCubitCubit, HomeCubitState>(
                buildWhen: (previous, current) =>
                    current is FetchingHadithBooksState ||
                    current is FetchingHadithBooksErrorState ||
                    current is FetchingHadithBooksSuccessState,
                builder: (context, state) {
                  if (state is FetchingHadithBooksSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount:
                            context.read<HomeCubitCubit>().hadithBooks.length,
                        itemBuilder: (context, index) =>
                            HadithItem(index: index),
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

class HadithItem extends StatelessWidget {
  const HadithItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, left: 12.w, right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.offRed),
          borderRadius: BorderRadius.circular(6.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                translateHadithName(
                    context.read<HomeCubitCubit>().hadithBooks[index].id),
                style: const TextStyle(
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const VerticalSpacer(height: 6),
              Text(context.read<HomeCubitCubit>().hadithBooks[index].id),
            ],
          ),
          Column(
            children: [
              const Text(
                "عدد الأحاديث",
              ),
              const VerticalSpacer(height: 6),
              Text(
                context
                    .read<HomeCubitCubit>()
                    .hadithBooks[index]
                    .count
                    .toString(),
                style: const TextStyle(
                  color: AppColors.offRed,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomHadithShimmer extends StatelessWidget {
  const CustomHadithShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          margin: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 12.h),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6.r)),
        ),
      ),
    );
  }
}

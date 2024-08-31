import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/cubit/home_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/svg_handler.dart';

class SurahsView extends StatelessWidget {
  const SurahsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 26.h),
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
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8.r),
                        highlightColor: AppColors.white,
                        hoverColor:
                            AppColors.homeScaffoldContainer.withOpacity(0.2),
                        child: SurahItem(index: index),
                      ),
                    ),
                  );
                }
                return const AllSurahsShimmer();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_back_ios,
          fill: 0,
          weight: 0.2,
          size: 18,
          color: AppColors.black,
        ),
        const HorizontalSpacer(width: 16),
        context.read<HomeCubitCubit>().allSurahs[index].type == "Medinan"
            ? const SurahTypeContainer(type: "مدنية")
            : const SurahTypeContainer(type: "مكية"),
        const HorizontalSpacer(width: 20),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              context.read<HomeCubitCubit>().allSurahs[index].surahArabicName,
            ),
            const VerticalSpacer(height: 4),
            Text(
              context
                  .read<HomeCubitCubit>()
                  .allSurahs[index]
                  .englishTranslationName,
            ),
          ],
        ),
        const HorizontalSpacer(width: 24),
        Container(
          width: 28.w,
          height: 28.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.offRed),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            context
                .read<HomeCubitCubit>()
                .allSurahs[index]
                .surahOrder
                .toString(),
          ),
        ),
      ],
    );
  }
}

class SurahTypeContainer extends StatelessWidget {
  const SurahTypeContainer({
    super.key,
    required this.type,
  });
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      height: 28.h,
      width: 36.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(type),
    );
  }
}

class AllSurahsShimmer extends StatelessWidget {
  const AllSurahsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Expanded(
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => Divider(
            endIndent: 12.w,
            indent: 12.w,
            height: 18.h,
            color: Colors.grey.shade300,
          ),
          itemBuilder: (context, index) => ListTile(
            title: Container(
              height: 24.h,
              width: 42.w,
              color: Colors.grey.shade300,
            ),
            subtitle: Container(
              height: 16.h,
              width: 32.w,
              color: Colors.grey.shade300,
            ),
            leading: Container(
              height: 16.h,
              width: 20.w,
              color: Colors.grey.shade300,
            ),
            trailing: Container(
              height: 28.h,
              width: 32.w,
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 44.w,
            height: 42.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.textFieldFillColor.withOpacity(0.6),
              border: Border.all(color: AppColors.white),
              borderRadius: BorderRadius.circular(14.w),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              fill: 0,
              weight: 0.2,
              size: 20,
              color: AppColors.primaryBlueDarker,
            ),
          ),
        ),
        const HorizontalSpacer(width: 18),
        SizedBox(
          width: 255.w,
          child: CustomTextFormField(
            label: "Find",
            fillColor: AppColors.textFieldFillColor.withOpacity(0.6),
            borderRaduis: 14,
            prefixIcon: const SvgHandler(
              imagePath: 'assets/svgs/Search.svg',
              height: 20,
              width: 20,
            ),
            suffixIcon: const SvgHandler(
              imagePath: 'assets/svgs/search.svg',
              height: 26,
              width: 26,
            ),
          ),
        ),
      ],
    );
  }
}

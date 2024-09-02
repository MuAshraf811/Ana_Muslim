import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/surah_type_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

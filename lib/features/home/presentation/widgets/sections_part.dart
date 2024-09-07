import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/constants/app_route_path.dart';
import 'package:ana_muslim/core/constants/sections_constanst.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionsContainer extends StatelessWidget {
  const SectionsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor.withOpacity(0.65),
        border: Border.all(color: AppColors.white, width: 1.5.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomGridTile(
                  index: 0,
                  onTap: () {
                    context.read<HomeCubitCubit>().fetchSurahs();
                    Navigator.pushNamed(context, RoutesConstants.surahsView);
                  },
                ),
                CustomGridTile(
                  index: 1,
                  onTap: () {
                    context.read<HomeCubitCubit>().getAllHAdithBooks();
                    Navigator.pushNamed(context, RoutesConstants.hadithView);
                  },
                ),
                CustomGridTile(
                  index: 2,
                  onTap: () {
                    context.read<HomeCubitCubit>().initAzkarjson();
                    Navigator.pushNamed(context, RoutesConstants.azkarView);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomGridTile(
                  index: 3,
                  onTap: () {
                    context.read<HomeCubitCubit>().handleRadio();
                    Navigator.pushNamed(context, RoutesConstants.radioView);
                  },
                ),
                CustomGridTile(
                  index: 4,
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesConstants.sebhaView),
                ),
                CustomGridTile(
                  index: 5,
                  onTap: () {
                    context.read<HomeCubitCubit>().getPreyTime();
                    Navigator.pushNamed(context, RoutesConstants.preyTimesView);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({super.key, required this.index, required this.onTap});
  final int index;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(
              sectionImage[index],
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        const VerticalSpacer(height: 2),
        Text(sectionTitles[index],
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

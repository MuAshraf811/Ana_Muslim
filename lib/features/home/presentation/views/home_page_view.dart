// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/constants/sections_constanst.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:ana_muslim/features/home/presentation/widgets/random_allah_name_container.dart';
import 'package:ana_muslim/features/home/presentation/widgets/random_zekr_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_route_path.dart';
import '../controllers/cubit/home_cubit_cubit.dart';
import '../widgets/prayer_times_part.dart';
import '../widgets/random_doaa_container.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(),
          SliverToBoxAdapter(
            child: VerticalSpacer(height: 18),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: PrayerTimesContainer(),
            ),
          ),
          SliverToBoxAdapter(
            child: VerticalSpacer(height: 8),
          ),
          CustomGrid(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const RandomDoaaContainer(),
            ),
          ),
          SliverToBoxAdapter(
            child: VerticalSpacer(height: 18),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const RandomAllahNameContainer(),
            ),
          ),
          SliverToBoxAdapter(
            child: VerticalSpacer(height: 18),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const RandomZekrContainer(),
            ),
          ),
          SliverToBoxAdapter(
            child: VerticalSpacer(height: 18),
          ),
        ],
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
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.primary,
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primary,
      floating: true,
      collapsedHeight: 64.h,
      expandedHeight: 128.h,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Text(
              " إِنَّ الدِّينَ عِنْدَ اللَّهِ الإِسْلامُ ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
              ),
            ),
          ),
        ),
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/jama-masjid 1.png",
                color: AppColors.white.withOpacity(0.3),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const VerticalSpacer(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'الشرقية - مصر',
                        style: TextStyle(color: AppColors.white, fontSize: 14),
                      ),
                      HorizontalSpacer(width: 10),
                      SvgHandler(
                        imagePath: 'assets/svgs/location2.svg',
                        height: 17,
                        width: 17,
                        color: AppColors.white,
                      )
                    ],
                  ),
                  const VerticalSpacer(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '  أغسطس - 12 جماد الأول',
                        style: TextStyle(color: AppColors.white, fontSize: 14),
                      ),
                      const HorizontalSpacer(width: 10),
                      SvgHandler(
                        imagePath: 'assets/svgs/calendar-edit.svg',
                        height: 16,
                        width: 16,
                        color: AppColors.white,
                      )
                    ],
                  ),
                  const VerticalSpacer(height: 4),
                  Divider(
                    color: AppColors.white.withOpacity(0.5),
                    indent: 160.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGrid extends StatelessWidget {
  const CustomGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomGridTile(
                  imagePath: sectionImage[0],
                  text: sectionTitles[0],
                  onTap: () {
                    context.read<HomeCubitCubit>().fetchSurahs();
                    Navigator.pushNamed(context, RoutesConstants.surahsView);
                  },
                ),
                CustomGridTile(
                  imagePath: sectionImage[1],
                  text: sectionTitles[1],
                  onTap: () {
                    context.read<HomeCubitCubit>().getDoaa();
                    Navigator.pushNamed(context, RoutesConstants.doaaView);
                  },
                ),
                CustomGridTile(
                  imagePath: sectionImage[2],
                  text: sectionTitles[2],
                  onTap: () {
                    context.read<HomeCubitCubit>().initAzkarjson();
                    Navigator.pushNamed(context, RoutesConstants.azkarView);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomGridTile(
                  imagePath: sectionImage[3],
                  text: sectionTitles[3],
                  onTap: () {
                    context.read<HomeCubitCubit>().getNaway();
                    Navigator.pushNamed(context, RoutesConstants.nawawyView);
                  },
                ),
                CustomGridTile(
                  imagePath: sectionImage[4],
                  text: sectionTitles[4],
                  onTap: () {
                    context.read<HomeCubitCubit>().getAsmaaAllah();

                    Navigator.pushNamed(
                        context, RoutesConstants.asmaaAllahView);
                  },
                ),
                CustomGridTile(
                  imagePath: sectionImage[5],
                  text: sectionTitles[5],
                  onTap: () {
                    context.read<HomeCubitCubit>().getAllPreyTime();
                    Navigator.pushNamed(context, RoutesConstants.preyTimesView);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomGridTile(
                  imagePath: sectionImage[6],
                  text: sectionTitles[6],
                  onTap: () {
                    Navigator.pushNamed(context, RoutesConstants.sebhaView);
                  },
                ),
                CustomGridTile(
                  imagePath: sectionImage[7],
                  text: sectionTitles[7],
                  onTap: () {
                    context.read<HomeCubitCubit>().getAllHAdithBooks();
                    Navigator.pushNamed(context, RoutesConstants.hadithView);
                  },
                ),
                CustomGridTile(
                  imagePath: sectionImage[8],
                  text: sectionTitles[8],
                  onTap: () {
                    context.read<HomeCubitCubit>().handleRadio();
                    Navigator.pushNamed(context, RoutesConstants.radioView);
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
  const CustomGridTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  });
  final String imagePath;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86.w,
      // height: 86.h,
      margin: EdgeInsets.only(left: 10.w, bottom: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondry),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 44.w,
              height: 38.h,
              color: AppColors.secondry,
            ),
            const VerticalSpacer(height: 3),
            Text(
              text,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}

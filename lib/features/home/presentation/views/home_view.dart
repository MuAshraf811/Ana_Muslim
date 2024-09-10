import 'dart:math';

import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/cubit/nav_b_ar_cubit.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/location_and_image.dart';
import 'package:ana_muslim/features/home/presentation/widgets/prayer_times_part.dart';
import 'package:ana_muslim/features/home/presentation/widgets/search_and_notification.dart';
import 'package:ana_muslim/features/home/presentation/widgets/sections_part.dart';
import 'package:ana_muslim/features/qiblah/presentation/qiblah_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import '../../../setting/presentation/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const List<Widget> _views = [HomePage(), QiblahView(), SettingsView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const CustomNavBAr(),
      body: BlocBuilder<NavBArCubit, int>(
        builder: (context, state) => _views[state],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Stack(
              children: [
                SizedBox(height: 495.h, width: double.infinity),
                Container(
                  width: double.infinity,
                  height: 360.h,
                  decoration: BoxDecoration(
                      color: AppColors.homeScaffoldContainer,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32.r),
                        bottomRight: Radius.circular(32.r),
                      )),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/images/air.png',
                    height: 274.h,
                  ),
                ),
                Positioned(
                  top: 20.h,
                  left: 24.w,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        opacity: 0.9,
                        duration: Duration(seconds: 2),
                        curve: Curves.bounceOut,
                        child: SearchAndNotification(),
                      ),
                      VerticalSpacer(height: 12),
                      LocationAndImage(),
                      VerticalSpacer(height: 24),
                      PrayerTimesContainer(),
                      VerticalSpacer(height: 8),
                    ],
                  ),
                ),
              ],
            ),
            const VerticalSpacer(height: 12),
            Positioned(
              top: 290.h,
              child: const SectionsContainer(),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.primaryBlueDarker),
            borderRadius: BorderRadius.circular(6.r),
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
                    onTap: () {},
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
                    current is DetailedAzkarState ||
                    current is DetailedAzkarSuccessState,
                builder: (context, state) {
                  if (state is DetailedAzkarSuccessState) {
                    return Text(
                      context
                          .read<HomeCubitCubit>()
                          .someZekr![Random().nextInt(1)]
                          .text,
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
        ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     DatePart(),
        //     //  HorizontalSpacer(width: 8),
        //     IslamicInformation(),
        //   ],
        // ),
      ],
    );
  }
}

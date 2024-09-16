import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/constants/app_route_path.dart';
import 'package:ana_muslim/core/cubit/nav_b_ar_cubit.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/location_and_image.dart';
import 'package:ana_muslim/features/home/presentation/widgets/prayer_times_part.dart';
import 'package:ana_muslim/features/home/presentation/widgets/search_and_notification.dart';
import 'package:ana_muslim/features/home/presentation/widgets/sections_part.dart';
import 'package:ana_muslim/features/qiblah/presentation/qiblah_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import '../../../setting/presentation/settings_view.dart';
import '../widgets/random_zekr_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> _views = [
    const HomePage(),
    const QiblahView(),
    BlocProvider<HomeCubitCubit>(
      create: (context) => HomeCubitCubit()..getAllPreyTime(),
      child: const SettingsView(),
    ),
  ];

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
                SizedBox(height: 600.h, width: double.infinity),
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
        const RandomZekrContainer(),
        const VerticalSpacer(height: 24),
        InkWell(
          onTap: () {
            context.read<HomeCubitCubit>().getSallahZeker();
            Navigator.pushNamed(context, RoutesConstants.sallehZekrView);
          },
          child: Container(
            padding: EdgeInsets.only(
                right: 22.w, left: 22.h, top: 14.h, bottom: 12.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.offRed)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 18.w,
                  color: AppColors.offRed,
                ),
                const Text(
                  "أذكار مابعد الصلاة",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
        const VerticalSpacer(height: 16),
      ],
    );
  }
}

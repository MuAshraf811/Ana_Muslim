import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/cubit/nav_b_ar_cubit.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/widgets/date_part.dart';
import 'package:ana_muslim/features/home/presentation/widgets/location_and_image.dart';
import 'package:ana_muslim/features/home/presentation/widgets/prayer_times_part.dart';
import 'package:ana_muslim/features/home/presentation/widgets/search_and_notification.dart';
import 'package:ana_muslim/features/home/presentation/widgets/sections_part.dart';
import 'package:ana_muslim/features/qiblah/presentation/qiblah_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import '../widgets/islamic_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const List<Widget> _views = [HomePage(), QiblahView()];

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
    return Column(
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
                      SearchAndNotification(),
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DatePart(),
            //  HorizontalSpacer(width: 8),
            IslamicInformation(),
          ],
        ),
      ],
    );
  }
}

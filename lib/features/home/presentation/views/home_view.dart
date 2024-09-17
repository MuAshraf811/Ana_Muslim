import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/constants/app_route_path.dart';
import 'package:ana_muslim/core/cubit/nav_b_ar_cubit.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/views/dummy_view.dart';
import 'package:ana_muslim/features/home/presentation/widgets/prayer_times_part.dart';
import 'package:ana_muslim/features/home/presentation/widgets/random_doaa_container.dart';
import 'package:ana_muslim/features/home/presentation/widgets/sections_part.dart';
import 'package:ana_muslim/features/qiblah/presentation/qiblah_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import '../../../setting/presentation/settings_view.dart';
import '../widgets/random_allah_name_container.dart';
import '../widgets/random_zekr_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> _views = [
    const DummyView(),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ListView(
        children: [
          //   const SearchAndNotification(),
          //   const VerticalSpacer(height: 12),
          // const LocationAndImage(),
          const VerticalSpacer(height: 24),
          const PrayerTimesContainer(),
          const VerticalSpacer(height: 8),

          const SectionsContainer(),
          const VerticalSpacer(height: 16),
          const RandomDoaaContainer(),
          const VerticalSpacer(height: 12),
          const RandomAllahNameContainer(),
          const VerticalSpacer(height: 12),
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
      ),
    );
  }
}

import 'package:ana_muslim/core/cubit/nav_b_ar_cubit.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../utils/functions.dart';

class CustomNavBAr extends StatelessWidget {
  const CustomNavBAr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBArCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: getthemecolor(context),
          type: BottomNavigationBarType.shifting,
          elevation: 16,
          currentIndex: context.read<NavBArCubit>().state,
          onTap: (value) => context.read<NavBArCubit>().changeIndex(value),
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: 100.w,
                  height: 36.h,
                  padding: EdgeInsets.only(left: 12.w, top: 2.h),
                  margin: EdgeInsets.only(top: 6.h),
                  decoration: BoxDecoration(
                      color: context.read<NavBArCubit>().state == 0
                          ? AppColors.primary.withOpacity(0.2)
                          : null,
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_filled,
                        size: 25,
                        color: context.read<NavBArCubit>().state == 0
                            ? AppColors.primary
                            : AppColors.blackText,
                      ),
                      const HorizontalSpacer(width: 6),
                      Text(
                        'الرئيسية',
                        style: TextStyle(
                          fontSize: 15,
                          color: context.read<NavBArCubit>().state == 0
                              ? AppColors.primary
                              : AppColors.blackText,
                        ),
                      )
                    ],
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                  width: 100.w,
                  height: 36.h,
                  padding: EdgeInsets.only(left: 12.w, top: 2.h),
                  margin: EdgeInsets.only(top: 6.h),
                  decoration: BoxDecoration(
                      color: context.read<NavBArCubit>().state == 1
                          ? AppColors.primary.withOpacity(0.3)
                          : null,
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Row(
                    children: [
                      SvgHandler(
                          imagePath: 'assets/svgs/kaaba-solid-svgrepo-com.svg',
                          color: context.read<NavBArCubit>().state == 1
                              ? AppColors.primary
                              : AppColors.blackText,
                          height: 18,
                          width: 18),
                      const HorizontalSpacer(width: 6),
                      Text(
                        'القبلة',
                        style: TextStyle(
                          fontSize: 15,
                          color: context.read<NavBArCubit>().state == 1
                              ? AppColors.primary
                              : AppColors.blackText,
                        ),
                      )
                    ],
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                  width: 100.w,
                  height: 36.h,
                  padding: EdgeInsets.only(left: 12.w, top: 2.h),
                  margin: EdgeInsets.only(top: 6.h),
                  decoration: BoxDecoration(
                      color: context.read<NavBArCubit>().state == 2
                          ? AppColors.primary.withOpacity(0.3)
                          : null,
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Row(
                    children: [
                      SvgHandler(
                          imagePath: 'assets/svgs/profile-nav.svg',
                          height: 18,
                          color: context.read<NavBArCubit>().state == 2
                              ? AppColors.primary
                              : AppColors.blackText,
                          width: 18),
                      const HorizontalSpacer(width: 6),
                      Text(
                        'الإعدادات',
                        style: TextStyle(
                          fontSize: 15,
                          color: context.read<NavBArCubit>().state == 2
                              ? AppColors.primary
                              : AppColors.blackText,
                        ),
                      )
                    ],
                  ),
                ),
                label: ""),
          ],
        );
      },
    );
  }
}

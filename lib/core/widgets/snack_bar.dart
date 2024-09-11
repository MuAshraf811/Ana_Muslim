import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showCustomSnackBar(BuildContext context, String text, Color backgroundColor,
    {int duration = 3}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      showCloseIcon: true,
      closeIconColor: AppColors.white,
      duration: Duration(seconds: duration),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(color: AppColors.white, width: 2.h),
      ),
      content: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.white,
        ),
      ),
    ),
  );
}

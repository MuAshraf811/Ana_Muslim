import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/styles/text_styles.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePart extends StatelessWidget {
  const DatePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: AppColors.primaryBlueDarker,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style: getBoldStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                  const HorizontalSpacer(width: 32),
                  Text(
                    'Friday',
                    style: getBoldStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(height: 10),
              Text(
                '1-9-2024',
                style: getBoldStyle(
                  fontSize: 14,
                  color: AppColors.white,
                  isItalic: true,
                ),
              ),
              const VerticalSpacer(height: 10),
              Text(
                '6-3-1448',
                style: getBoldStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  isItalic: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

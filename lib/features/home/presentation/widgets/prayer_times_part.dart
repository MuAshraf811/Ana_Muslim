import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/styles/text_styles.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimesContainer extends StatelessWidget {
  const PrayerTimesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 315.w,
      //height: 146.h,
      padding: EdgeInsets.only(right: 32.w, left: 18.w, top: 8.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Duhar',
                style: getBoldStyle(
                  fontSize: 14,
                  color: AppColors.white,
                  isItalic: true,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text(
                    '01:15',
                    style: getBoldStyle(
                      fontSize: 40,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                  const HorizontalSpacer(width: 5),
                  Text(
                    'pm',
                    style: getBoldStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(height: 12),
              Text(
                'Next Pray : Asr',
                style: getRegularStyle(
                  fontSize: 13,
                  color: AppColors.white,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text(
                    '03:32',
                    style: getBoldStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                  const HorizontalSpacer(width: 5),
                  Text(
                    'pm',
                    style: getBoldStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(height: 12),
            ],
          ),
          Transform.translate(
            offset: Offset(24.w, 3.h),
            child: SizedBox(
              height: 120.h,
              child: Image.asset(
                'assets/images/jama-masjid 1.png',
                color: AppColors.white.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

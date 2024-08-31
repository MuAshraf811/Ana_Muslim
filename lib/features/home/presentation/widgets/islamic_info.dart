import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/styles/text_styles.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IslamicInformation extends StatelessWidget {
  const IslamicInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -70.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 14.w),
              decoration: BoxDecoration(
                color: AppColors.offRed.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Islamic Information',
                    style: getBoldStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                  const VerticalSpacer(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

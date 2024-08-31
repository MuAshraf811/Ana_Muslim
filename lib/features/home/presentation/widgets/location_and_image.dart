import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/styles/text_styles.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationAndImage extends StatelessWidget {
  const LocationAndImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Location',
              style: getBoldStyle(
                fontSize: 14,
                color: AppColors.white,
                isItalic: true,
              ),
            ),
            Text(
              'Swalleh , Faqous , Sharkia, Egypt , Africa',
              style: getBoldStyle(
                fontSize: 16,
                color: AppColors.primaryBlue,
                isItalic: true,
              ),
            )
          ],
        ),
        const HorizontalSpacer(width: 38),
        CircleAvatar(
          radius: 16.w,
          backgroundColor: Colors.amber,
        )
      ],
    );
  }
}

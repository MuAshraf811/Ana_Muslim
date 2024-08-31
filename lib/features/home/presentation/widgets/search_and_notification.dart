import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/custom_text_field.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAndNotification extends StatelessWidget {
  const SearchAndNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 255.w,
          child: CustomTextFormField(
            label: "Find",
            fillColor: AppColors.textFieldFillColor.withOpacity(0.6),
            borderRaduis: 14,
            prefixIcon: const SvgHandler(
              imagePath: 'assets/svgs/Search.svg',
              height: 20,
              width: 20,
            ),
            suffixIcon: const SvgHandler(
              imagePath: 'assets/svgs/search.svg',
              height: 36,
              width: 36,
            ),
          ),
        ),
        const HorizontalSpacer(width: 16),
        Container(
          width: 44.w,
          height: 42.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.textFieldFillColor.withOpacity(0.6),
            border: Border.all(color: AppColors.white),
            borderRadius: BorderRadius.circular(14.w),
          ),
          child: const SvgHandler(
            imagePath: 'assets/svgs/Notification.svg',
            height: 22,
            width: 22,
          ),
        ),
      ],
    );
  }
}

import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/svg_handler.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 44.w,
            height: 42.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.textFieldFillColor.withOpacity(0.6),
              border: Border.all(color: AppColors.white),
              borderRadius: BorderRadius.circular(14.w),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              fill: 0,
              weight: 0.2,
              size: 20,
              color: AppColors.primaryBlueDarker,
            ),
          ),
        ),
        const HorizontalSpacer(width: 18),
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
              height: 26,
              width: 26,
            ),
          ),
        ),
      ],
    );
  }
}

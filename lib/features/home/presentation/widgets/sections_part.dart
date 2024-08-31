import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/constants/sections_constanst.dart';
import 'package:ana_muslim/core/styles/text_styles.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/views/azkar_view.dart';
import 'package:ana_muslim/features/home/presentation/views/surahs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionsContainer extends StatelessWidget {
  const SectionsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor.withOpacity(0.65),
        border: Border.all(color: AppColors.white, width: 1.5.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 1.8,
          crossAxisSpacing: 18.h,
          mainAxisSpacing: 12.w,
        ),
        itemBuilder: (context, index) => SizedBox(
          height: 80.h,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SurahsView(),
                        ),
                      );
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AzkarView(),
                        ),
                      );

                    default:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SurahsView(),
                        ),
                      );
                  }
                },
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        sectionImage[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              const VerticalSpacer(height: 2),
              Text(
                sectionTitles[index],
                style: getBoldStyle(
                  fontSize: 14,
                  color: AppColors.blackText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

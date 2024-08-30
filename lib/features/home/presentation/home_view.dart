import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/constants/sections_constanst.dart';
import 'package:ana_muslim/core/styles/text_styles.dart';
import 'package:ana_muslim/core/widgets/custom_text_field.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBAr(),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 360.h,
                decoration: BoxDecoration(
                    color: AppColors.homeScaffoldContainer,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32.r),
                      bottomRight: Radius.circular(32.r),
                    )),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  'assets/images/air.png',
                  height: 274.h,
                ),
              ),
              Positioned(
                top: 20.h,
                left: 24.w,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchAndNotification(),
                    VerticalSpacer(height: 12),
                    LocationAndImage(),
                    VerticalSpacer(height: 24),
                    PrayerTimesContainer(),
                    VerticalSpacer(height: 8),
                  ],
                ),
              ),
            ],
          ),
          const SectionsContainer(),
          const VerticalSpacer(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DatePart(),
              HorizontalSpacer(width: 8),
              IslamicInformation(),
            ],
          ),
        ],
      ),
    );
  }
}

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

class DatePart extends StatelessWidget {
  const DatePart({
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
              width: 140.w,
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
        ),
      ),
    );
  }
}

class SectionsContainer extends StatelessWidget {
  const SectionsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -72.h),
      child: Container(
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
          itemBuilder: (context, index) => Column(children: [
            Container(
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
            const VerticalSpacer(height: 2),
            Text(
              sectionTitles[index],
              style: getBoldStyle(
                fontSize: 14,
                color: AppColors.blackText,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class PrayerTimesContainer extends StatelessWidget {
  const PrayerTimesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      //height: 146.h,
      padding: EdgeInsets.only(right: 8.w, left: 18.w, top: 8.h),
      decoration: BoxDecoration(
        color: AppColors.offRed.withOpacity(0.75),
        borderRadius: BorderRadius.circular(12.r),
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 0.4.w,
          colors: [
            AppColors.primary,
            AppColors.homeScaffoldContainer,
            AppColors.offRed.withOpacity(0.75)
          ],
        ),
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
            offset: Offset(4.w, 3.h),
            child: SizedBox(
              height: 120.h,
              child: Image.asset(
                'assets/images/jama-masjid 1.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

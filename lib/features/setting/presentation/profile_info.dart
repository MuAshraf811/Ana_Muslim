import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/constants/app_route_path.dart';
import 'package:ana_muslim/core/widgets/custom_button.dart';
import 'package:ana_muslim/core/widgets/custom_text_field.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoView extends StatefulWidget {
  const ProfileInfoView({super.key});

  @override
  State<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends State<ProfileInfoView> {
  Alignment _alignment = Alignment.centerLeft; // Start from the left
  double _opacity = 0;
  Alignment _alignment2 = Alignment.centerRight;
  @override
  void initState() {
    super.initState();
    // Trigger the animation after the widget is built
    Future.delayed(Duration.zero, () {
      setState(() {
        _alignment = Alignment.center; //  Animate to the center
        _opacity = 1;
        _alignment2 = Alignment.centerLeft;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            const VerticalSpacer(height: 28),
            AnimatedAlign(
              alignment: _alignment,
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 1),
              child: const Text(
                'Profile Information',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondry),
              ),
            ),
            const VerticalSpacer(height: 28),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: const Text(
                'Profile Photo',
                style: TextStyle(fontSize: 16, color: AppColors.primary),
              ),
            ),
            const VerticalSpacer(height: 12),
            AnimatedAlign(
              alignment: _alignment2,
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 1),
              child: Stack(
                children: [
                  Container(
                    width: 110.w,
                    height: 75.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white)),
                  ),
                  Container(
                    width: 75.w,
                    height: 75.w,
                    margin: EdgeInsets.only(left: 16.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary)),
                  ),
                  Positioned(
                    left: 60.w,
                    top: 24.h,
                    child: Container(
                      width: 24.w,
                      height: 24.w,
                      margin: EdgeInsets.only(left: 16.w),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.secondry)),
                      alignment: Alignment.center,
                      child: const SvgHandler(
                        imagePath: 'assets/svgs/Frame.svg',
                        height: 18,
                        width: 18,
                        color: AppColors.secondry,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacer(height: 12),
            Divider(
              indent: 24.w,
              endIndent: 24.w,
              color: AppColors.secondry,
            ),
            const VerticalSpacer(height: 12),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    fillColor: AppColors.white,
                    label: "الاسم الأول",
                    labelStyle: const TextStyle(fontSize: 10),
                    suffixIcon: const Icon(
                      Icons.person,
                      color: AppColors.secondry,
                    ),
                    onChanged: (val) {},
                    borderRaduis: 8,
                  ),
                ),
                const HorizontalSpacer(width: 20),
                Expanded(
                  child: CustomTextFormField(
                    fillColor: AppColors.white,
                    label: "الأسم الأخير",
                    labelStyle: const TextStyle(fontSize: 10),
                    borderRaduis: 8,
                    suffixIcon: const Icon(
                      Icons.person,
                      color: AppColors.secondry,
                    ),
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),
            const VerticalSpacer(height: 16),
            CustomTextFormField(
              fillColor: AppColors.white,
              label: 'تاريخ الميلاد',
              suffixIcon: const Icon(
                Icons.calendar_month,
                color: AppColors.secondry,
              ),
              borderRaduis: 8,
              onChanged: (val) {},
            ),
            const VerticalSpacer(height: 16),
            CustomTextFormField(
              fillColor: AppColors.white,
              label: ' محل الإقامة',
              suffixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.secondry,
              ),
              borderRaduis: 8,
              onChanged: (val) {},
            ),
            const VerticalSpacer(height: 16),
            CustomTextFormField(
              fillColor: AppColors.white,
              label: 'نبذة عنك',
              suffixIcon: const Icon(
                Icons.info_outline,
                color: AppColors.secondry,
              ),
              borderRaduis: 8,
              isBuildCounterWantd: true,
              maxLength: 100,
              textFormFieldHeight: 100,
              maxLines: 10,
              minLines: 8,
              onChanged: (val) {},
            ),
            const VerticalSpacer(height: 28),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceOut,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesConstants.homePage);
                      },
                      width: 100,
                      borderRaduis: 8,
                      height: 36,
                      text: 'تخطي',
                      buttonColor: AppColors.secondry.withOpacity(0.9),
                      textColor: AppColors.white,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 12,
                    ),
                    CustomButton(
                      onTap: () {},
                      width: 100,
                      borderRaduis: 8,
                      height: 36,
                      text: 'تأكيد',
                      buttonColor: AppColors.primary,
                      textColor: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/constants/app_route_path.dart';
import 'package:ana_muslim/core/widgets/custom_button.dart';
import 'package:ana_muslim/core/widgets/custom_text_field.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 150.h,
              width: 200.w,
              child: Image.asset(
                'assets/images/air.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: const Text(
                      'Profile Photo',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const VerticalSpacer(height: 12),
                  Container(
                    width: 75.w,
                    height: 75.w,
                    margin: EdgeInsets.only(left: 16.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.offRed)),
                  ),
                  const VerticalSpacer(height: 12),
                  Divider(
                    indent: 24.w,
                    endIndent: 24.w,
                    color: AppColors.primaryBlueDarker,
                  ),
                  const VerticalSpacer(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          label: "الاسم الأول",
                          suffixIcon: const Icon(Icons.person),
                          onChanged: (val) {},
                          borderRaduis: 8,
                        ),
                      ),
                      const HorizontalSpacer(width: 20),
                      Expanded(
                        child: CustomTextFormField(
                          label: "الأسم الأخير",
                          borderRaduis: 8,
                          suffixIcon: const Icon(Icons.person),
                          onChanged: (val) {},
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacer(height: 16),
                  CustomTextFormField(
                    label: 'تاريخ الميلاد',
                    suffixIcon: const Icon(Icons.calendar_month),
                    borderRaduis: 8,
                    onChanged: (val) {},
                  ),
                  const Spacer(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 24.h),
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
                          buttonColor: AppColors.offRed.withOpacity(0.7),
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
                          buttonColor: AppColors.primaryBlueDarker,
                          textColor: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

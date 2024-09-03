import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/custom_button.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/provider/sebha_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/quran_view_appbar.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(height: 16),
              const QuranAppBar(text: 'فَاذْكُرُونِي أَذْكُرْكُمْ'),
              const VerticalSpacer(height: 28),
              Expanded(
                child: Consumer<SebhaProvider>(
                  builder: (context, value, child) => ListView(
                    children: [
                      CustomSebhaItem(
                        zekr: 'أستغفر الله ',
                        count: value.countEsghfar,
                        onRebeat: () {
                          Provider.of<SebhaProvider>(context, listen: false)
                              .estghfer();
                        },
                        onReset: () =>
                            Provider.of<SebhaProvider>(context, listen: false)
                                .resetEstgher(),
                      ),
                      CustomSebhaItem(
                        zekr: 'الله أكبر ',
                        count: value.countTakber,
                        onRebeat: () {
                          Provider.of<SebhaProvider>(context, listen: false)
                              .kber();
                        },
                        onReset: () =>
                            Provider.of<SebhaProvider>(context, listen: false)
                                .resetKeber(),
                      ),
                      CustomSebhaItem(
                        zekr: 'الحمدلله ',
                        count: value.countHamed,
                        onRebeat: () {
                          Provider.of<SebhaProvider>(context, listen: false)
                              .hamed();
                        },
                        onReset: () =>
                            Provider.of<SebhaProvider>(context, listen: false)
                                .resetHamed(),
                      ),
                      CustomSebhaItem(
                        zekr: ' سبحان الله ',
                        count: value.countTasbeh,
                        onRebeat: () {
                          Provider.of<SebhaProvider>(context, listen: false)
                              .sebeh();
                        },
                        onReset: () =>
                            Provider.of<SebhaProvider>(context, listen: false)
                                .resetSbeh(),
                      ),
                      CustomSebhaItem(
                        zekr: ' لا حول ولا قوة إلا بالله',
                        count: value.countHowkala,
                        onRebeat: () {
                          Provider.of<SebhaProvider>(context, listen: false)
                              .hawkel();
                        },
                        onReset: () =>
                            Provider.of<SebhaProvider>(context, listen: false)
                                .resetHawkel(),
                      ),
                      CustomSebhaItem(
                        zekr: ' سبحان الله وبحمده سبحان الله العظيم',
                        count: value.countTesbehKamel,
                        onRebeat: () {
                          Provider.of<SebhaProvider>(context, listen: false)
                              .sebeh2();
                        },
                        onReset: () =>
                            Provider.of<SebhaProvider>(context, listen: false)
                                .resetsebeh2(),
                      ),
                      CustomSebhaItem(
                        zekr: 'اللهم صل علي محمد وعلي آله وصحبه وسلم',
                        count: value.countSallah,
                        onRebeat: () {
                          Provider.of<SebhaProvider>(context, listen: false)
                              .sallah();
                        },
                        onReset: () =>
                            Provider.of<SebhaProvider>(context, listen: false)
                                .resetSallah(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSebhaItem extends StatelessWidget {
  const CustomSebhaItem({
    super.key,
    required this.zekr,
    required this.count,
    required this.onRebeat,
    required this.onReset,
  });
  final String zekr;
  final int count;
  final VoidCallback onRebeat;
  final VoidCallback onReset;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding:
          EdgeInsets.only(left: 12.w, bottom: 14.h, right: 12.w, top: 10.h),
      height: 156.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.offRed),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Text(
            zekr,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColors.blackText,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const VerticalSpacer(height: 12),
          Container(
            width: 36.w,
            height: 36.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.offRed),
                shape: BoxShape.circle),
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: onRebeat,
                  buttonColor: AppColors.white,
                  textColor: AppColors.offRed,
                  borderRaduis: 8,
                  border: Border.all(color: AppColors.offRed),
                  width: double.infinity,
                  height: 32,
                  text: "تكرار",
                ),
              ),
              const HorizontalSpacer(width: 12),
              CustomButton(
                onTap: onReset,
                buttonColor: AppColors.white,
                textColor: AppColors.offRed,
                borderRaduis: 8,
                border: Border.all(color: AppColors.offRed),
                width: 80,
                height: 32,
                text: "البدأ",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

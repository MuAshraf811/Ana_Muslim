import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VerticalSpacer(height: 16),
          const QuranAppBar(),
          const VerticalSpacer(height: 18),
          Expanded(
            child: ListView.separated(
              itemCount: 301,
              separatorBuilder: (context, index) => Divider(
                endIndent: 4.w,
                indent: 4.w,
                height: 24.h,
                color: AppColors.black,
              ),
              itemBuilder: (context, index) =>
                  QuranOnePageItem(pageIndex: index),
            ),
          ),
        ],
      ),
    );
  }
}

class QuranAppBar extends StatelessWidget {
  const QuranAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 32.h,
              padding: EdgeInsets.only(left: 6.w),
              width: 32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: AppColors.offRed),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: 16.w,
              ),
            ),
          ),
          const HorizontalSpacer(width: 32),
          Container(
            height: 32.h,
            width: 220.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.offRed),
            ),
            child: const Text(
              'وَلَقَدْ يَسَّرْنَا الْقُرْآنَ لِلذِّكْرِ فَهَلْ مِنْ مُدَّكِرٍ',
            ),
          ),
        ],
      ),
    );
  }
}

class QuranOnePageItem extends StatelessWidget {
  const QuranOnePageItem({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/Quran/00${pageIndex + 1}.png"),
        Image.asset("assets/images/Quran/000${pageIndex + 1}.png"),
      ],
    );
  }
}

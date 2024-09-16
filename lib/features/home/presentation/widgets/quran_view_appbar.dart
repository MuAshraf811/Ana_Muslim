import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';

class QuranAppBar extends StatelessWidget {
  const QuranAppBar({super.key, this.text, this.borederClor});
  final String? text;
  final Color? borederClor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                border: Border.all(color: borederClor ?? AppColors.offRed),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: 16.w,
              ),
            ),
          ),
          const HorizontalSpacer(width: 10),
          Container(
            height: 32.h,
            //  width: 220.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: borederClor ?? AppColors.offRed),
            ),
            child: Text(
              text ??
                  'وَلَقَدْ يَسَّرْنَا الْقُرْآنَ لِلذِّكْرِ فَهَلْ مِنْ مُدَّكِرٍ',
            ),
          ),
        ],
      ),
    );
  }
}
